#!/usr/bin/env perl

# Generate binary necklaces of length n with m ones and allowed intervals pi.

use strict;
use warnings;

use lib 'lib';
use Util;
use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $n1 = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n m p1 p2 ...\n"
  unless $n && $n1 && @aparts;

my @data;
my @parts = (1);
my $nap = @aparts;
my $i = 0;

neckbin(1, 1, 0, 1);

print ddc(\@data),
  'Size: ', scalar @data, "\n";

# k = length of necklace
# l = length of longest prefix that is a lyndon word
# m = number of parts (ones)
# p = size of the next part

sub neckbin {
  my ($k, $l, $m, $p) = @_;

  if ($k > $n) {
    if(($n % $l) == 0 && Util::allowed($p, \@aparts) && $p <= $n && $m == $n1) {
      for $k (1 .. $n) {
        push $data[$i]->@*, $parts[$k];
      }

      $i++;
    }
  }
  else {
    $parts[$k] = $parts[ $k - $l ];
    if ($parts[$k] == 1) {
      if (Util::allowed($p, \@aparts) || $k == 1) {
        neckbin($k + 1, $l, $m + 1, 1);
      }
      $parts[$k] = 0;
      neckbin($k + 1, $k, $m, $p + 1);
    }
    else {
      neckbin($k + 1, $l, $m, $p + 1);
    }
  }
}
