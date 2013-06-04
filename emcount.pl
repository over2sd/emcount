#!/usr/bin/perl
require 5.10.1;

use strict;
use warnings;

sub countHed{
	my $in = shift;
	my $ems = 0.0;
	for (my $i = 0; $i < length($in); $i++) {
		my $x = substr($in,$i,1);
		if ($x eq '.' or $x eq '*' or $x eq '(' or $x eq ')' or $x eq '[' or $x eq ']' or $x eq '\\') {
			$ems+=0.5;
		} elsif ($x eq '?') {
			$ems++;
		} elsif ("MW" =~ m/$x/) {
			$ems+=2.0;
		} elsif (" qeryuopasdghkzxcvbn234567890" =~ m/$x/) {
			$ems++;
		} elsif ("mwQERTYUOPASDFGHJKLZXCVBN\$\%\&_" =~ m/$x/){
			$ems+=1.5;
		} else {
			$ems+=0.5;
		}
	}
	return $ems;
};

my $text = shift;
print "Input: \"".$text."\"\nThis text contains ".length($text)." characters and has an em width of ";
print countHed($text).".\n";