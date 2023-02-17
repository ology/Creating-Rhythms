#!/usr/bin/env perl

# Reverse a part of a bitstring at n.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);

my $n = shift;
my @aparts = @ARGV;

die "Usage: perl $0 n p1 p2 ... pm\n"
  unless @aparts;

my @head = @aparts[ 0 .. $n - 1 ];
my @tail = reverse @aparts[ $n .. $#aparts ];

my @data = (@head, @tail);

print join(' ', @data), "\n";
#print ddc(\@aparts), "$n =>\n", ddc(\@data),
#  'Size: ', scalar @data, "\n";
