#!/usr/bin/env perl

# Generate all binary necklaces of length n.

use strict;
use warnings;

use lib 'lib';
use Util;
use Data::Dumper::Compact qw(ddc);

my $n = shift || die "Usage: perl $0 n\n";

my @data;

my @lex = Util::lex_iter($n);

for my $i (reverse @lex) {
  push @data, $i
    unless Util::has_rotation($i, @data);
}

print ddc(\@data),
  'Size: ', scalar(@data), "\n";
