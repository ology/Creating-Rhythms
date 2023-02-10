#!/usr/bin/env perl

# Generate all binary necklaces of length n with m ones.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $n1 = shift || die "Usage: perl $0 n m\n";

my @data;
my @parts = (1);
my $i = 0;

neckbin(1, 1, 0);

print ddc(\@data),
  'Size: ', scalar @data, "\n";

# k = length of necklace
# l = length of longest prefix that is a lyndon word
# m = number of parts (ones)

sub neckbin {
  my ($k, $l, $m) = @_;

  if ($k > $n) {
    if (($n % $l) == 0 && $m == $n1) {
      for $k (1 .. $n) {
        push $data[$i]->@*, $parts[$k];
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
