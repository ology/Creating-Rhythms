#!/usr/bin/env perl

# Generate all compositions of n into m parts.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n  = shift;
my $mp = shift || die "Usage: perl $0 n m\n";

$mp--;

my @data;
my @parts;
my $i = 0;

compose($n - 1, 1, 0);

print join(' ', @data), "\n";
#print ddc(\@data),
#  'Size: ', scalar @data, "\n";

sub compose {
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

  if ($m < $mp) {
    $parts[$m] = $p;

    compose($n - 1, 1, $m + 1);
  }

  compose($n - 1, $p + 1, $m);
}
