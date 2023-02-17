#!/usr/bin/env perl

# Rotate a binary necklace of the given 0/1 parts n times.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Music::AtonalUtil ();

my $n = shift;
my @aparts = @ARGV;

die "Usage: perl $0 n p1 p2 ... pm\n"
  unless @aparts;

my $atu = Music::AtonalUtil->new;

my $data = $atu->rotate($n, \@aparts);

print ddc(\@aparts), "$n =>\n", ddc($data),
  'Size: ', scalar @$data, "\n";
