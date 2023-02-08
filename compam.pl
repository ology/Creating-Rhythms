#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $mp = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n m p1 p2 ...\n\nGenerate compositions of n with m parts from the set (p1 p2 ...)\n"
  unless $n && $mp && @aparts;

$mp--;

my @intervals;
my @parts;
my $nap = @aparts;
my $i = 0;

compose($n - 1, 1, 0);

print ddc(\@intervals),
  'Size: ', scalar @intervals, "\n";

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
    if ($m == $mp && allowed($p)) {
      while ($n < $m) {
        push $intervals[$i]->@*, $parts[$n];
        $n++;
      }

      push $intervals[$i]->@*, $p;

      $i++;
    }

    return;
  }

  if ($m < $mp && allowed($p)) {
    $parts[$m] = $p;

    compose($n - 1, 1, $m + 1);
  }

  compose($n - 1, $p + 1, $m);
}
