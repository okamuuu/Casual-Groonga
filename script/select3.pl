#!/usr/bin/env perl
use strict;
use warnings;
use URI;
use LWP::UserAgent;

my $uri = URI->new("http://localhost:10041/d/select"); 
$uri->query_form(
    table         => 'Article',
    match_columns => 'title,content',
    query          => 'perl',
    query_cache    => 'no',
); 

my $ua = LWP::UserAgent->new();
my $res = $ua->get($uri);

warn $res->content if $res->is_success;
