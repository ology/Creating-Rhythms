#!/usr/bin/env perl

# Generate the upper or lower Christoffel word for p/q
# Pages 49-53

use strict;
use warnings;

my $t = shift || 'u'; # type of word: u=upper, l=lower
my $p = shift || 2;   # numerator of slope
my $m = shift || 14;  # maximum denominator
my $n = shift || 16;  # number of terms to generate

for my $q (1 .. $m) {
  my @data;
  my $i = 0;

  while ($i < $n) {
    push @data, $t eq 'u' ? 1 : 0;

    $i++;

    my ($x, $y) = ($p, $q);

    while ($x != $y && $i < $n) {
      if ($x > $y) {
        push @data, 1;
        $y += $q;
      }
      else {
        push @data, 0;
        $x += $p;
      }

      $i++;
    }

    if ($x == $y && $i < $n) {
      push @data, $t eq 'u' ? 0 : 1;
      $i++;
    }
  }

  print join(' ', @data), "\n";
}
