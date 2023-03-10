package Util;

use strict;
use warnings;

use String::CyclicRotation qw(is_rotation);

=head1 FUNCTIONS

=head2 lex_sort

Sort an array of array references in lexicographical order.

=cut

sub lex_sort {
  my (@data) = @_;
  return map { [ split //, $_ ] }
    sort { $a cmp $b }
      map { join '', @$_ } @data;
}

=head2

Does the given string have a rotation in the list of strings?

=cut

sub has_rotation {
  my ($string, @strings) = @_;

  my $ones = $string =~ tr/1//;

  my $found = 0;

  for my $i (@strings) {
    my $onesi = $i =~ tr/1//;
    if ($string eq $i || ($ones == $onesi && is_rotation($string, $i))) {
      $found++;
      last;
    }
  }

  return $found;
}

=head2 lex_iter

Add the binary numbers from C<0> to C<2 ** N - 1> to a list.

=cut

sub lex_iter {
  my ($n) = @_;

  my @bin = map { sprintf '%0*b', $n, $_ } 0 .. 2 ** $n - 1;

  return @bin;
}

sub intervals2bin {
  my (@aparts) = @_;
  my %bin;
  for my $i (@aparts) {
      next unless $i; # don't allow zero
      my $bits = '1' . '0' x ($i - 1);
      $bin{$bits} = $i;
  }
  return %bin;
}

=head2 allowed

Only allow ...

=cut

sub allowed {
  my ($p, $parts) = @_;

  for my $i (0 .. $#$parts) {
    return 1 if $p == $parts->[$i];
  }

  return 0;
}

1;
