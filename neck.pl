#!/usr/bin/env perl

# Generate all binary necklaces of length n.

use strict;
use warnings;

use lib 'lib';
use Util;
use Data::Dumper::Compact qw(ddc);

my $n = shift || die "Usage: perl $0 n\n";

my @lex;
my @data;

for my $i (0 .. 2 ** $n - 1) {
  my $x = sprintf '%0*b', $n, $i; 
  push @lex, $x;
}

for my $i (reverse @lex) {
  push @data, $i
    unless Util::has_rotation($i, @data);
}

print ddc(\@data),
  'Size: ', scalar(@data), "\n";
