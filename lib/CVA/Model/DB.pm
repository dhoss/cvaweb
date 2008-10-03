package CVA::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'CVA::Schema',
    connect_info => [
        'dbi:SQLite:cva.sqlite',
        
    ],
);

=head1 NAME

CVA::Model::DB - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<CVA>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<CVA::Schema>

=head1 AUTHOR

Devin,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
