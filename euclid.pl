#!/usr/bin/env perl

# Generate a Euclidean rhythm given n onsets distributed over m beats.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n = shift;
my $m = shift || die "Usage: perl $0 n m\n";

my $data = euclid($n, $m);

print join(' ', @$data), "\n";#,
#  'Size: ', scalar @$data, "\n";

sub euclid {
    my ($p, $q) = @_;

    my $intercept = 1;

    my $slope = $p / $q;

    my @onsets = ('0') x $q;

    for my $y ( 1 .. $p ) {
        $onsets[ sprintf "%.0f", ( $y - $intercept ) / $slope ] = '1';
    }

    return \@onsets;
};
