#!/usr/bin/env perl
use strict;
use warnings;
use URI;
use LWP::UserAgent;

my $uri = URI->new("http://localhost:10041/d/select"); 
$uri->query_form( table => 'Keyword',  query => "_key:perl" );

my $ua = LWP::UserAgent->new();
my $res = $ua->get($uri);

warn $res->content if $res->is_success;
