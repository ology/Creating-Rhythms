#!/usr/bin/env perl

# Generate all partitions of n with allowed parts pi.

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Data::Munge qw(list2re);
use Integer::Partition ();
use List::Util qw(all);

my $n = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n p1 p2 ...\n"
  unless $n && @aparts;

my @data;

my $re = list2re @aparts;

my $i = Integer::Partition->new($n, { lexicographic => 1 });

while (my $p = $i->next) {
  push @data, [ sort { $a <=> $b } @$p ]
    if all { $_ =~ /^$re$/ } @$p;
}

print join(' ', @data), "\n";
#print ddc(\@data),
#  'Size: ', scalar @data, "\n";
