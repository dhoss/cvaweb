package CVA::Controller::Users;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';
use CVA::Messages::Email;


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

	my @errors = ();
	my $form   = $c->stash->{form};
	$c->stash->{template} = "users/create.tt2";
	
	## check to see if we have a user in the db with this email
	my $user =
	  $c->model('DB::User')->find_or_new( { email => $form->param('email') } );

	## let's make sure we have a valid form
	if ( $form->submitted_and_valid ) {

		$c->model('DB::user')->update($user);
		
		# Set a status message for the user
		$c->stash->{status_msg} =
		  "Thank you for registering! A confirmation email has been sent to "
		  . $form->param('email');

		$c->detach;

	}

	## our form has an error, it's in our call back since
	## we got to this point
	if ( $user->in_storage() ) {
		$c->log->debug("In storage:" . $user->in_storage );

		$form->get_field('email')->get_constraint( { type => 'Callback' } )
		  ->force_errors(1);

		$form->process;

	}

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
