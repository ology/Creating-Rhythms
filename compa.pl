#!/usr/bin/env perl

# Generate compositions of n with allowed parts pi.

use strict;
use warnings;

use Algorithm::Combinatorics qw(permutations);
use Data::Dumper::Compact qw(ddc);
use Data::Munge qw(list2re);
use Integer::Partition ();
use List::Util qw(all);

my $n = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n p1 p2 ...\n"
  unless $n && @aparts;

my @data;
my %seen;

my $re = list2re @aparts;

my $i = Integer::Partition->new($n);

while (my $p = $i->next) {
  my $iter = permutations($p);

  while (my $x = $iter->next) {
    next if $seen{"@$x"}++; # skip duplicate permutations

    push @data, $x
      if all { $_ =~ /^$re$/ } @$x;
  }
}

# make sure the data is in lexicographical order
@data = map { [ split //, $_ ] }
  sort { $a cmp $b }
    map { join '', @$_ } @data;

print ddc(\@data),
  'Size: ', scalar @data, "\n";
