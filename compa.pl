#!/usr/bin/env perl

# Generate compositions of n with allowed parts pi.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n p1 p2 ...\n"
  unless $n && @aparts;

my @data;
my @parts;
my $nap = @aparts;
my $i = 0;

compose($n - 1, 1, 0);

print ddc(\@data),
  'Size: ', scalar @data, "\n";

sub allowed {
  my ($p) = @_;

  for my $i (0 .. $nap - 1) {
    return 1 if $p == $aparts[$i];
  }

  return 0;
}

sub compose {
  my ($n, $p, $m) = @_;

  if ($n == 0) {
    if (allowed($p)) {
      while ($n < $m) {
        push $data[$i]->@*, $parts[$n];
        $n++;
      }

      push $data[$i]->@*, $p;

      $i++;
    }

    return;
  }

  if (allowed($p)) {
    $parts[$m] = $p;

    compose($n - 1, 1, $m + 1);
  }

  compose($n - 1, $p + 1, $m);
}
