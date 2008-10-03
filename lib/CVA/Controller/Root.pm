package CVA::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in CVA.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

CVA::Controller::Root - Root Controller for CVA

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

http://website.com/

Just serve up the index/main page.

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    
    $c->stash->{template} = "index.tt2";
}


=head2 default

http://website.com/

Serve up a 404 error page for non-existent items.

=cut
sub default :Path {
    my ( $self, $c ) = @_;
    $c->res->body( 'Page not found' );
    $c->res->status(404);
    
}

=head2 end

Attempt to render a view, if needed.

=cut 

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Devin Austin
devin.austin@gmail.com

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
