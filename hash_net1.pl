
#---------------------------------------------------------------------------
# Part 3:  Nets (unrouted) from cel file and generate ttnet file
#---------------------------------------------------------------------------

# Woohyuk 2014 08 - (get netlist from cel file)
print "Reading CEL file ${celfile}...\n";

my %net_hash=();
my $netitem_array_ref;
my $net_name;
my $netitem_name;
my $pinname;

my @celllist=();
my $cellname;
my $cellid;

while (my $line = <$fcel>) {
  chomp $line;

  if($line=~ /^cell[ \t]+(.+)[ \t]+(.+)[ \t]*/) {
    $cellid=$1; 
    $cellname=$2;

    # -. Update cell_t - no need for now
    push (@celllist, $cellname);
  } 
  elsif($line=~ /^hardcell[ \t]+(.+)[ \t]+name[ \t]+(.+)[ \t]*/) {
    $cellid=$1; 
    $cellname=$2;

    # -. Update hardcell_t - no need for now
    push (@celllist, $cellname);
  } 
  elsif($line=~ /^pad[ \t]+(.+)[ \t]+name[ \t]+(.+)[ \t]*/) {
    $cellid=$1; 
    $cellname=$2;
    push (@celllist, $cellname);
  } 
  elsif($line=~ /^pin[ \t]+name[ \t]+(.+)[ \t]+signal[ \t]+(.+)layer[ \t]+(.+)[ \t]+(.+)[ \t]+(.+)[ \t]*/) {
    $pinname=$1; 
    my $signame=$2;
    my $layernum=$3;
    my $pinx=$4;
    my $piny=$5;

   # -. Update cell_t's pins
   # -. Update net_t 

   # make net's name
   # signame is the net's name
   $net_name=$signame;
   if(exists $net_hash{$net_name}) {
     $netitem_array_ref=$net_hash{$net_name};
   }
   else {
     $netitem_array_ref=[];
   }

   if($cellname =~ /^twpin_/) {
     $netitem_name= "PIN/" . $pinname;
   }
   else {
     $netitem_name= $cellname . "/" . $pinname;
   }

   # net_hash (net_name, net_item_array)
   push (@$netitem_array_ref, $netitem_name); 
   $net_hash{$net_name}=$netitem_array_ref;
