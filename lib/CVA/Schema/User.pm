package CVA::Schema::User;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("user");
__PACKAGE__->add_columns(
  "key",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "about",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "created",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "email",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "last_here",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "name",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "password",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "profile_image",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "userid",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("userid");


# Created by DBIx::Class::Schema::Loader v0.04004 @ 2008-10-07 16:26:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hsexJtTSVVPl4mAIIATFNQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
