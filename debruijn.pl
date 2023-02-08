#!/usr/bin/env perl

# Generate the largest de Bruijn sequence of order n.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Math::Sequence::DeBruijn qw(debruijn);

my $n = shift // die "Usage: perl $0 n\n";

my $sequence = $n ? debruijn([1,0], $n) : 0;

print "$sequence\n",
  'Size: ', length $sequence, "\n";

