#!/usr/bin/env perl

# Generate all compositions of n.

use strict;
use warnings;

use Algorithm::Combinatorics qw(permutations);
use Data::Dumper::Compact qw(ddc);
use Integer::Partition ();

my $n = shift || die "Usage: perl $0 n\n";

my @data;
my %seen;

my $i = Integer::Partition->new($n, { lexicographic => 1 });

while (my $p = $i->next) {
    my $iter = permutations($p);

    while (my $x = $iter->next) {
      next if $seen{"@$x"}++;

      push @data, $x;
    }
}

print ddc(\@data),
  'Size: ', scalar @data, "\n";
