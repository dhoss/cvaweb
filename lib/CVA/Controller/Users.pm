package CVA::Controller::Users;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';
use CVA::Messages::Email;
use CVA::Users;
use DateTime;     ## do we want to do something else for this? maybe some DBIC trickery?

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
	my $key  = CVA::Users->new->generate_key(
	
	    $form->param('name'),
	    $form->param('password'),
	    $form->param('email')
	
	);
    $user->key($key);
    $user->created( DateTime->now );

	## user exists, so we'll return the proper error
	if ( $user->in_storage() ) {

		$form->get_field('email')->get_constraint( { type => 'Callback' } )
		  ->force_errors(1);

		$form->process;
		$c->detach();

	}

	## let's make sure we have a valid form
	if ( $form->submitted_and_valid ) {

        ## trap errors
 		eval {
			## insert the object into the database
			$user->insert;

			## send an email to the user with their registraion key
			CVA::Messages::Email->send_simple_email(
				$form->param('email'),
				'Thanks for signing up!',
				"Thank you for signing up."
			);

			# Set a status message for the user
			$c->stash->{status_msg} =
               "Thank you for registering! A confirmation email has been sent to "
			  . $form->param('email');

			$c->detach;
		};
		
		## something went awry
		if ( $@ ) {
			
			$c->log->debug("ERROR: " . $@);
			$c->stash->{error_msg} = "Oops! Something went wrong!";
			$c->detach;
			
		}

	}

}


=head2 confirm

  Check by confirmation key if a user
  has confirmed their account or not. 

=cut
sub confirm : Local {
	my ($self, $c, $key) = @_;
	my $user;
	$c->stash->{template} = "users/confirm.tt2";
	
	eval {
		
		$user = $c->model('DB::User')->find({ key => $key });
		
	};
	
	if ($@) {
		$c->stash->{error_msg} = "No key provided.";
		$c->detach;
		
	}
	
	
	if ( $user->confirmed ) {
		
		$c->stash->{error_msg} = "This account has already been confirmed";
		
	} else {
		
		if ( $user->key eq $key ) {
			
			$user->confirmed(1);
			$user->update;
			$c->stash->{confirmed} = 1;
			$c->stash->{status_msg} = "Sucessfully confirmed!";
			$c->detach;
			
		} else {
			
			$c->stash->{error_msg} = "Confirmation key doesn't match!";
			$c->detach;
			
		}
		
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
