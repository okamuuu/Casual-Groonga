#!/usr/bin/env perl
use strict;
use warnings;
use URI;
use LWP::UserAgent;

my $port = $ENV{GROONGA_PORT} || 10041;

my $uri = URI->new("http://localhost:$port/d/select"); 
$uri->query_form( table => 'Keyword' );

my $ua = LWP::UserAgent->new();
my $res = $ua->get($uri);

print $res->content if $res->is_success;

