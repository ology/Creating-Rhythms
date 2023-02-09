#!/usr/bin/env perl

# Generate all compositions of n.

use strict;
use warnings;

use lib 'lib';
use Util;
use Algorithm::Combinatorics qw(permutations);
use Data::Dumper::Compact qw(ddc);
use Integer::Partition ();

my $n = shift || die "Usage: perl $0 n\n";

my @data;
my %seen;

my $i = Integer::Partition->new($n);

while (my $p = $i->next) {
    my $j = permutations($p);

    while (my $q = $j->next) {
      next if $seen{"@$q"}++; # skip the duplicate permutations

      push @data, $q;
    }
}

# make sure the data is in lexicographical order
@data = Util::lex_sort(@data);

print ddc(\@data),
  'Size: ', scalar @data, "\n";
