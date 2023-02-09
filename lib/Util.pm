package Util;

use strict;
use warnings;

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

1;
