#!/usr/bin/env perl

# Generate all binary necklaces of length n.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use String::CyclicRotation qw(is_rotation);

my $n = shift || die "Usage: perl $0 n\n";

my @lex;
my @data;

for my $i (0 .. 2 ** $n - 1) {
  my $x = sprintf '%0*b', $n, $i; 
  push @lex, $x;
}

for my $i (reverse @lex) {
  push @data, $i unless has_rotation($i, @data);
}

print ddc(\@data),
  'Size: ', scalar(@data), "\n";

sub has_rotation {
  my ($string, @strings) = @_;

  my $found = 0;

  for my $i (@strings) {
    next if $string eq $i;

    if (is_rotation($string, $i)) {
      $found++;
      last;
    }
  }

  return $found;
}
