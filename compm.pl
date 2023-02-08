#!/usr/bin/env perl

# Generate all compositions of n into m parts.

use strict;
use warnings;

use Algorithm::Combinatorics qw(permutations);
use Data::Dumper::Compact qw(ddc);
use Integer::Partition ();

my $n = shift;
my $m = shift || die "Usage: perl $0 n m\n";

my @data;
my %seen;

my $i = Integer::Partition->new($n);

while (my $p = $i->next) {
    my $j = permutations($p);

    while (my $q = $j->next) {
      next if $seen{"@$q"}++; # skip duplicate permutations

      push @data, $q
        if @$q == $m;
    }
}

# make sure the data is in lexicographical order
@data = map { [ split //, $_ ] }
  sort { $a cmp $b }
    map { join '', @$_ } @data;

print ddc(\@data),
  'Size: ', scalar @data, "\n";
