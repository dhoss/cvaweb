package CVA::Controller::Message;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

CVA::Controller::Message - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index 

=cut

sub index : Private {
	my ( $self, $c ) = @_;

	$c->response->body('Matched CVA::Controller::Message in Message.');
}

sub email : Private {
	my ( $self, $c ) = @_;

	
}

=head1 AUTHOR

Devin Austin 
http://www.onthebeachatnight.com
devin@onthebeachatnight.com

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
