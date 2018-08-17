use strict;

package HTML::FormFu::Deflator::TauStation::Duration;

use Moose;
extends 'HTML::FormFu::Deflator';

use DateTime::Format::TauStation;

sub deflator {
    my ( $self, $value ) = @_;

    my $return;

    eval { $return = DateTime::Format::TauStation->format_duration( $value ) };

    if ($@) {
        $return = $value;
    }

    return $return;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

HTML::FormFu::Deflator::TauStation::Duration

=head1 SYNOPSIS

    ---
    elements:
        - type: Text
          contraint:
              - 'TauStation::Duration'
          inflator:
              - 'TauStation::Duration'
          deflator:
              - 'TauStation::Duration'

=head1 DESCRIPTION

String deflator for L<DateTime::Duration::TauStation> objects.

=head1 SEE ALSO

L<DateTime::Calendar::TauStation>.

L<DateTime::Format::TauStation>.

L<HTML::FormFu::TauStation>.

Is a sub-class of, and inherits methods from L<HTML::FormFu::Constraint>

L<HTML::FormFu>

=head1 AUTHOR

Carl Franks, C<github@tauhead.com>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
