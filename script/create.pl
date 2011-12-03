#!/usr/bin/env perl
use strict;
use warnings;
use URI;
use LWP::UserAgent;
use JSON ();

my $port = $ENV{GROONGA_PORT} || 10041; 

my $uri = URI->new("http://localhost:$port/d/load"); 
$uri->query_form(
    table  => 'Article',
    ifexists => 0,
    values => JSON::encode_json(
        [   
            {   
                "keywords" => [ "perl", "javascript", "php" ],
                "_key"     => "new_record",
                "content"  => "this is new record.",
                "display_fg" => "0",
                "title" => "new record",
            }
        ]
    )
);

my $ua = LWP::UserAgent->new();
my $res = $ua->get($uri);
print $res->content if $res->is_success;

