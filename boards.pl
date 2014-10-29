#!/usr/bin/perl -w
use strict;

use CGI;

use CGI::Carp 'fatalsToBrowser';


my $cgi = new CGI;
print $cgi->header();



use JSON;
use Data::Dumper;
use WWW::Mechanize;
use HTML::TreeBuilder::XPath;

my $mech = WWW::Mechanize->new;
$mech->agent_alias( 'Windows Mozilla' );

my $board_id = "pl0hFBtJ";
my $application_key = "f7445919a9537828fa2758a3bff25286";
my $user_token = "eb68d896b82b731bc3856d1db16d4f32fb35a5ce6b13276ef4eb11abc1297660";

$mech->get("https://api.trello.com/1/organizations/cairs/boards?key=$application_key&token=$user_token");
# eb68d896b82b731bc3856d1db16d4f32fb35a5ce6b13276ef4eb11abc1297660
	
my $html = $mech->content;
my $tree = HTML::TreeBuilder::XPath->new;
$tree->parse( $html );

print $mech->content;



#my $form = $tree->findnodes( '//body//form[2]' ); #
#my $form_com_dados_html =  $form->[0]->as_HTML; #