#!/usr/bin/env perl

# Generate compositions of n with m parts from the set (p1 p2 ...).

use strict;
use warnings;

use lib 'lib';
use Util;
use Algorithm::Combinatorics qw(permutations);
use Data::Dumper::Compact qw(ddc);
use Data::Munge qw(list2re);
use Integer::Partition ();
use List::Util qw(all);

my $n = shift;
my $m = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n m p1 p2 ...\n"
  unless $n && $m && @aparts;

my @data;
my %seen;

my $re = list2re @aparts;

my $i = Integer::Partition->new($n);

while (my $p = $i->next) {
  my $j = permutations($p);

  while (my $q = $j->next) {
    next if $seen{"@$q"}++; # skip duplicate permutations

    push @data, $q
      if @$q == $m && all { $_ =~ /^$re$/ } @$q;
  }
}

# make sure the data is in lexicographical order
@data = Util::lex_sort(@data);

print ddc(\@data),
  'Size: ', scalar @data, "\n";
