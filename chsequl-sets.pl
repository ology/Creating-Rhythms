#!/usr/bin/env perl

# Generate the upper or lower Christoffel word for p/q
# Pages 49-53

# Arguments:
# t = required type of word (u: upper, l: lower)
# p = required numerator of slope
# n = optional number of terms to generate, default: 16

# q = computed denominator of slope

use strict;
use warnings;

my $t = shift || 'u';
my $p = shift || die "Usage: perl $0 type numerator [terms]\n";
my $n = shift || 16;

for my $q (1 .. 14) {
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
