#!/usr/bin/env perl

# Generate permutations of the given strings.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Algorithm::Combinatorics qw(permutations);

my @aparts = @ARGV;

die "Usage: perl $0 a1 a2 ... an\n"
  unless @aparts;

my @data = permutations(\@aparts);

print join(' ', @data), "\n";
