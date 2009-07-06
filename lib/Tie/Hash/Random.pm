=head1 NAME

Tie::Hash::Random - Generates random different numbers for different fetched keys

=head1 SYNOPSIS

  use Tie::Hash::Random;

  my %hash;
  tie %hash, 'Tie::Hash::Random';

  my $a_random_number           = $hash{foo};
  my $an_other_random_number    = $hash{bar};

  $a_random_number == $hash{foo}; ## True

=head1 DESCRIPTION

Tie::Hash::Random generates a random number each time a different
key is fetched.


=cut

package Tie::Hash::Random; 

use 5.006;
use strict;
use warnings;
use vars qw($VERSION @ISA);
use Tie::Hash;

$VERSION = '1.0';
@ISA = qw(Tie::StdHash);

=head2 STORE

Stores data 

=cut

sub STORE {
  my ($self, $key, $val) = @_;
  $self->{$key} = $val;
}

=head2 FETCH

Fetchs

=cut

sub FETCH {
  my ($self, $key) = @_;

  $self->{key} = rand() if ! exists $self->{key};

  return $self->{$key};
}


1;
__END__


=head1 AUTHOR

Matias Alejo Garcia <matiu@cpan.org>

=head1 UPDATES

The latest version of this module will always be available from
from CPAN
at L<http://search.cpan.org/~ematiu>.

=head1 COPYRIGHT

Copyright (C) 2009, Matias Alejo Garcia

=head1 LICENSE

This script is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 SEE ALSO

perl(1), perltie(1), Tie::StdHash(1), Tie::Hash::Cannabinol

=cut
