#!/usr/bin/env perl

# Generate all binary necklaces of length n with m ones.

use strict;
use warnings;

use lib 'lib';
use Util;
use Data::Dumper::Compact qw(ddc);

my $n = shift;
my $m = shift // die "Usage: perl $0 n m\n";

my @lex;
my @data;

for my $i (0 .. 2 ** $n - 1) {
  my $x = sprintf '%0*b', $n, $i; 
  push @lex, $x;
}

for my $i (reverse @lex) {
  my $ones = $i =~ tr/1//;
  push @data, $i
    if $ones == $m && !Util::has_rotation($i, @data);
}

print ddc(\@data),
  'Size: ', scalar(@data), "\n";
