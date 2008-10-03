package CVA::View::Email;

use strict;
use base 'Catalyst::View::Email';

__PACKAGE__->config(
    stash_key => 'email'
);

=head1 NAME

CVA::View::Email - Email View for CVA

=head1 DESCRIPTION

View for sending email from CVA. 

=head1 AUTHOR

Devin,,,

=head1 SEE ALSO

L<CVA>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
