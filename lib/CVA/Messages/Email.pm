package CVA::Messages::Email;

use MIME::Lite;

=head2 send_simple_email

  send a text only email message

=cut

sub send_simple_email {
	my ( $to, $subject, $message ) = @_;

	my $email = MIME::Lite->new(

		From    => 'test@test.com',#CVA->config->{email_config}->{from_address},
		To      => $to,
		Subject => $subject,
		Data    => $message

	);

	$email->send('smtp', 'localhost:2500');

}

1;
