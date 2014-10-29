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

$mech->get("https://api.trello.com/1/cards/D1TmEJ5X/actions?key=$application_key&token=$user_token&actions=commentCard");
# eb68d896b82b731bc3856d1db16d4f32fb35a5ce6b13276ef4eb11abc1297660
# members/52130369d45d5c5434000d05/cards
	
my $html = $mech->content;
my $tree = HTML::TreeBuilder::XPath->new;
$tree->parse( $html );

print $mech->content;

my $json = JSON->new;

my $board_obj = $json->decode($mech->content);


#print "Board name: " . $board_obj->{name} . '<br><br>';

my $arrLists = $board_obj->{lists};
#print "total lists: " . scalar @$arrLists . '<br><br>';
foreach( @$arrLists )
{    
    #print $_->{id} . " - " .$_->{name} . '<br>';
}

#print '<br><br>';

my $arrCards = $board_obj->{cards};
#print "total cards: " . scalar @$arrCards . '<br><br>';
foreach( @$arrCards )
{    
    #print $_->{id} . " - ". $_->{idList} . " - " .$_->{name} . '<br>>>>> Description <br>';
    #print $_->{desc} . '<br>>>>> Card URL <br>';
    #print $_->{url} . '<br>>>>>> ---------------------------------------------- <<<<<<br><br>';
}


#print '<br><br><br><br>>>>>> ---------------------------------------------- <<<<<<br><br>';

$json = $json->pretty(1);

my $json_text = $json->encode($board_obj); 
print "var board" . ' = ' . $json_text;


#my $form = $tree->findnodes( '//body//form[2]' ); #
#my $form_com_dados_html =  $form->[0]->as_HTML; #