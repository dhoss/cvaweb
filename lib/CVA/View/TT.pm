package CVA::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
	CATALYST_VAR => 'c',
    INCLUDE_PATH => [
        CVA->path_to( 'root', 'src' ),
        CVA->path_to( 'root', 'lib' )
    ],
    PRE_PROCESS  => 'config/main',
    WRAPPER      => 'site/wrapper',
    ERROR        => 'error.tt2',
    TIMER        => 0
});

=head1 NAME

CVA::View::TT - Catalyst TTSite View

=head1 SYNOPSIS

See L<CVA>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

Devin,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

