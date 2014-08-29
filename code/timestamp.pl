#!/usr/bin/env perl
# find out when a Wikidata property was created

use v5.14;
use LWP::Simple qw(get);
use JSON;

foreach my $property (@ARGV) {
    my $title = "Property:$property"; 
    my $url =  "http://www.wikidata.org/w/api.php?" 
        . "action=query&prop=revisions&titles=$title"
        . "&rvprop=timestamp&format=json&rvdir=newer&rvlimit=1";

    my $json = JSON->new->utf8->decode(get($url));

    my ($page) = values %{$json->{query}->{pages}};
    my $timestamp = $page->{revisions}->[0]->{timestamp};
    say "$property\t$timestamp";
}
