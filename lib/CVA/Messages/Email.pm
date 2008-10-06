package CVA::Messages::Email;

use MIME::Lite;

sub send_simple_email {
	my ( $to, $subject, $message ) = @_;

	my $email = MIME::Lite->new(

		From    => CVA->config->{email_config}{from_address},
		To      => $t0,
		Subject => $subject,
		Data    => $message

	);

	$email->send;

}

1;
