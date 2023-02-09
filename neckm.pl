#!/usr/bin/env perl

# Generate all binary necklaces of length n with m ones.

use strict;
use warnings;

use lib 'lib';
use Util;
use Data::Dumper::Compact qw(ddc);

my $n = shift;
my $m = shift // die "Usage: perl $0 n m\n";

my @data;

my @lex = Util::lex_iter($n);

for my $i (reverse @lex) {
  my $ones = $i =~ tr/1//;
  push @data, $i
    if $ones == $m && !Util::has_rotation($i, @data);
}

print ddc(\@data),
  'Size: ', scalar(@data), "\n";
