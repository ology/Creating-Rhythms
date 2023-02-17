#!/usr/bin/env perl

# Generate the upper or lower Christoffel word for p/q
# Arguments:
# t = required type of word (u: upper, l: lower)
# p = required numerator of slope
# q = required denominator of slope
# n = optional number of terms to generate, default = p+q

use strict;
use warnings;

my $t = shift;
my $p = shift;
my $q = shift || die "Usage: perl $0 type numerator denominator [terms]\n";
my $n = shift;

$n ||= $p + $q;
 
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
