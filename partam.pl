#!/usr/bin/env perl

# Generate all partitions of n with m parts from the set (p1 p2 ...).

use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Data::Munge qw(list2re);
use Integer::Partition ();
use List::Util qw(all);

my $n = shift;
my $m = shift;
my @aparts = @ARGV; # allowed parts

die "Usage: perl $0 n m p1 p2 ...\n"
  unless $n && $m && @aparts;

my @data;

my $re = list2re @aparts;

my $i = Integer::Partition->new($n);

while (my $p = $i->next) {
    push @data, [ sort { $a <=> $b } @$p ]
      if @$p == $m && all { $_ =~ /^$re$/ } @$p;
}

print join(' ', @data), "\n";
#print ddc(\@data),
#  'Size: ', scalar @data, "\n";
