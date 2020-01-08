
my $pl1name= "$topname.pl1";
my $defname= "$topname.def";
my $celfile= "$topname.cel";
my $netfile= "$topname.ttnet";
my $netfile_h1= $topname . "_h1.ttnet";
my $netfile_hc= $topname . "_hc.ttnet";

open($fpl1, $pl1name) or die $!;
open($fdef, '>', $defname) or die $!;
open($fcel, $celfile) or die $!;
open($fnet, '>', $netfile) or die $!;
