use strict;
use warnings;
use Test::More 0.88;
use Test::Warn;
use File::Spec::Functions qw/catfile/;

use App::Ylastic::CostsAgent;

my @cases = (
  {
    label => 'Invalid account number',
    error => qr/Invalid AWS ID/,
    file => 'bad-account.ini',
  },
);

for my $c ( @cases ) {
  my $file = catfile( 't', 'data', $c->{file} );
  my $obj;
  warning_like {
    $obj = App::Ylastic::CostsAgent->new(config_file => $file);
  } $c->{error}, "$c->{label}: warning seen";
  ok( $obj, "$c->{label}: obj still created" );
}

done_testing;

