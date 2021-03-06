#!/usr/bin/perl
#
# Copyright 2014 Pierre Mavro <deimos@deimos.fr>
# Copyright 2014 Vivien Didelot <vivien@didelot.org>
# Copyright 2017 Alejandro Gallo <aamsgallo@gmail.com>
#
# Licensed under the terms of the GNU GPL v3, or any later version.
#
# This script is meant to use with i3blocks. It parses the output of the "acpi"
# command (often provided by a package of the same name) to read the status of
# the battery, and eventually its remaining time (to full charge or discharge).
#
# The color will gradually change for a percentage below 85%, and the urgency
# (exit code 33) is set if there is less that 5% remaining.

use strict;
use warnings;
use utf8;

my $acpi;
my $status;
my $percent;
my $full_text;
my $short_text;

open (ACPI, 'acpi -b |') or die "Can't exec acpi: $!\n";

# Read the whole ACPI output, line by line
while (<ACPI>) {
  # Read actual line
  my $acpi = $_;

  # fail on unexpected output
  if ($acpi !~ /: (\w+), (\d+)%/) {
    die "$acpi\n";
  }


  $status = $1;
  $percent = $2;
  $full_text .= "$percent% ";

  if ($status eq 'Discharging') {
    $full_text .= 'D ';
  } elsif ($status eq 'Charging') {
    $full_text .= 'C ';
  } elsif ($status eq 'Unknown') {
    $full_text .= '? ';
  } elsif ($status eq 'Full') {
    $full_text .= 'F ';
  }


  $short_text = $full_text;

  if ($acpi =~ /(\d\d:\d\d):/) {
    $full_text .= "($1)";
  }

}

close(ACPI);

# print text
print "$full_text\n";
print "$short_text\n";

exit(0);
