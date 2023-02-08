#!/usr/bin/env perl

# Generate all binary necklaces of length n with m ones.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $n1 = shift || die "Usage: perl $0 n m\n";

my @intervals;
my @parts = (1);

my $i = 0;

# k = length of necklace
# l = length of longest prefix that is a lyndon word
# m = number of parts (ones)

neckbin(1, 1, 0);

print ddc(\@intervals),
  'Size: ', scalar @intervals, "\n";

sub neckbin {
  my ($k, $l, $m) = @_;

  if ($k > $n) {
    if (($n % $l) == 0 && $m == $n1) {
      for $k (1 .. $n) {
        push $intervals[$i]->@*, $parts[$k];
      }

      $i++;
    }
  }
  else {
    $parts[$k] = $parts[ $k - $l ];
    if ($parts[$k] == 1) {
      neckbin($k + 1, $l, $m + 1);
      $parts[$k] = 0;
      neckbin($k + 1, $k, $m);
    }
    else {
      neckbin($k + 1, $l, $m);
    }
  }
}
