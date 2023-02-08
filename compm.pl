#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $mp = shift || die "Usage: perl $0 n m\n\nGenerate all compositions of n into m parts\n";

$mp--;

my @intervals;
my @parts;

my $i = 0;

compose($n - 1, 1, 0);

print ddc(\@intervals),
  'Size: ', scalar @intervals, "\n";

sub compose {
  my ($n, $p, $m) = @_;

  if ($n == 0) {
    if ($m == $mp) {
      while ($n < $m) {
        push $intervals[$i]->@*, $parts[$n];

        $n++;
      }

      push $intervals[$i]->@*, $p;

      $i++;
    }

    return;
  }

  if ($m < $mp) {
    $parts[$m] = $p;

    compose($n - 1, 1, $m + 1);
  }

  compose($n - 1, $p + 1, $m);
}
