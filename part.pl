#!/usr/bin/env perl

# Generate all partitions of n.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Integer::Partition ();

my $n = shift || die "Usage: perl $0 n\n";

my @data;

my $i = Integer::Partition->new($n, { lexicographic => 1 });

while (my $p = $i->next) {
    push @data, [ sort { $a <=> $b } @$p ];
}

print ddc(\@data),
  'Size: ', scalar @data, "\n";
