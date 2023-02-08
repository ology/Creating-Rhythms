#!/usr/bin/env perl

# Generate all partitions of n into m parts.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $mp = shift || die "Usage: perl $0 n m\n";

$mp--;

my @data;
my @parts;
my $i = 0;

partition($n - 1, 1, 0);

print ddc(\@data),
  'Size: ', scalar @data, "\n";

sub partition {
  my ($n, $p, $m) = @_;

  if ($n == 0) {
    if ($m == $mp) {
      while ($n < $m) {
        push $data[$i]->@*, $parts[$n];

        $n++;
      }

      push $data[$i]->@*, $p;

      $i++;
    }

    return;
  }

  return if $n < 0;

  if ($m < $mp) {
    $parts[$m] = $p;

    partition($n - $p, $p, $m + 1);
  }

  partition($n - 1, $p + 1, $m);
}
