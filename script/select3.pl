#!/usr/bin/env perl
use strict;
use warnings;
use URI;
use LWP::UserAgent;

my $port = $ENV{GROONGA_PORT} || 10041;

my $uri = URI->new("http://localhost:$port/d/select"); 
$uri->query_form(
    table         => 'Article',
    match_columns => 'title,content',
    query          => 'perl',
    query_cache    => 'no',
); 

my $ua = LWP::UserAgent->new();
my $res = $ua->get($uri);

print $res->content if $res->is_success;
