package Util;

use strict;
use warnings;

use String::CyclicRotation qw(is_rotation);

=head1 FUNCTIONS

=head2 lex_sort

Sort an array reference in lexicographical order.

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

  my $found = 0;

  for my $i (@strings) {
    next if $string eq $i;

    if (is_rotation($string, $i)) {
      $found++;
      last;
    }
  }

  return $found;
}

1;
