use strict;
use warnings;
use Test::More;
use Test::TCP 1.14;
use Test::Groonga 0.06;
use Capture::Tiny qw/capture/;
use Data::Dumper;

my $FILE = 't/test.grn';

if ( not Test::Groonga::_find_groonga_bin ) {
    plan skip_all => 'groonga binary is not found';
}

my $server = Test::Groonga->create(
    default_command_version => 2,
    protocol                => 'http',
    preload                 => $FILE,
);

ok($server);
my $port = $server->port;

ok($port, "port: $port");

local $ENV{GROONGA_PORT} = $port; 

is ( _loaded_count( capture { do 'script/load.pl' } ), 1 );
is ( _loaded_count( capture { do 'script/create.pl' } ), 0 );
is ( _selected_count( capture { do 'script/select.pl' }), 5 );
is ( _selected_count( capture { do 'script/select2.pl' }), 1 );
is ( _selected_count( capture { do 'script/select3.pl' }), 2 );
is ( _selected_count( capture { do 'script/select4.pl' }), 1 );

done_testing;

sub _loaded_count {
    my $json = shift;
    warn $json;
    my $data = JSON::decode_json($json);
    return $data->[1];
}

sub _selected_count {
    my $json = shift;
    warn $json;
    my $data = JSON::decode_json($json);
    return $data->[1]->[0]->[0]->[0];
}

