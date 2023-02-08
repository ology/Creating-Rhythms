#!/usr/bin/env perl

# Generate all partitions of n with m parts form the set (p1 p2 ...).

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $mp = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n m p1 p2 ...\n"
  unless $n && $mp && @aparts;

$mp--;

my @data;
my @parts;
my $nap = @aparts;
my $i = 0;

partition($n - 1, 1, 0);

print ddc(\@data),
  'Size: ', scalar @data, "\n";

sub allowed {
  my ($p) = @_;

  for my $i (0 .. $nap - 1) {
    return 1 if $p == $aparts[$i];
  }

  return 0;
}

sub partition {
  my ($n, $p, $m) = @_;

  if ($n == 0) {
    if ($m == $mp && allowed($p)) {
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

  if ($m < $mp && allowed($p)) {
    $parts[$m] = $p;

    partition($n - $p, $p, $m + 1);
  }

  partition($n - 1, $p + 1, $m);
}