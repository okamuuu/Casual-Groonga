#!/usr/bin/env perl
use strict;
use warnings;
use URI;
use LWP::UserAgent;
use JSON ();

my $uri = URI->new("http://localhost:10041/d/load"); 
$uri->query_form(
    table  => 'Article',
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

warn $res->content if $res->is_success;
