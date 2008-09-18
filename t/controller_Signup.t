use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'CVA' }
BEGIN { use_ok 'CVA::Controller::Signup' }

ok( request('/signup')->is_success, 'Request should succeed' );


