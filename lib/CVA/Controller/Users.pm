package CVA::Controller::Users;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';

=head1 NAME

CVA::Controller::Users - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index 

 display a sign up/login page or redirect them to their page
 if they're logged in

=cut

sub index : Path : Args(0) {
	my ( $self, $c ) = @_;

	$c->stash->{template} = "users/index.tt2";
}

=head2 create
 
 create a user.
 display a form if no form parameters have been submitted
 otherwise, create the user object and save it to the db.

=cut

sub create : Path("/signup") : FormConfig {
	my ( $self, $c ) = @_;

	my $form = $c->stash->{form};
	if ( $form->submitted_and_valid ) {

		my $user = $c->model('DB::User')->new_result( {} );

		
		$form->save_to_model($user);

		# Set a status message for the user
		$c->stash->{status_msg} = 'Book created';

		#$c->detach;
	}
	else {

	
	}
	$c->stash->{template} = "users/create.tt2";

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
