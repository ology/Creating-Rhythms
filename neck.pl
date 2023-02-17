#!/usr/bin/env perl

# Generate all binary necklaces of length n.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n = shift || die "Usage: perl $0 n\n";

my @data;
my @parts = (1);
my $i = 0;

neckbin(1, 1);

print join(' ', @data), "\n";
#print ddc(\@data),
#  'Size: ', scalar @data, "\n";

# k = length of necklace
# l = length of longest prefix that is a lyndon word

sub neckbin {
  my ($k, $l) = @_;

  if ($k > $n) {
    if(($n % $l) == 0) {
      for $k (1 .. $n) {
        push $data[$i]->@*, $parts[$k];
      }

      $i++;
    }
  }
  else {
    $parts[$k] = $parts[ $k - $l ];

    if ($parts[$k] == 1) {
      neckbin($k + 1, $l);
      $parts[$k] = 0;
      neckbin($k + 1, $k);
    }
    else {
      neckbin($k + 1, $l);
    }
  }
}
