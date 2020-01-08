
open($IPLOC1, $iploc_file1) or die $!;

while (my $line1 = <$IPLOC1>) {
  chomp $line1;
  my @src2_array= split(/ /, $line1);

  if(scalar(@src2_array) == 0) { next; }

  #if ( $src2_array[0] =~ /^###macro/) {
  if ( $src2_array[0] eq "###macro") {
    $macro_in=macro_t->new();
    $macro_in->name($src2_array[1]); # 
    $macro_in->inst_name($src2_array[2]); # 
    $macro_in->x1($src2_array[3]); # x1
    $macro_in->y1($src2_array[4]); # y1
    $macro_in->x2($src2_array[5]); # x2
    $macro_in->y2($src2_array[6]); # y2
    push @macro_array, $macro_in;
  }
  elsif ( $src2_array[0] eq "###macro_r") {
    $macror_in=macro_t->new();
    $macror_in->name($src2_array[1]); # 
    $macror_in->inst_name($src2_array[2]); # 
#print "macror read(", $macror_in->name, ")\n";
    $macror_in->x1($src2_array[3]); # x1
    $macror_in->y1($src2_array[4]); # y1
    $macror_in->x2($src2_array[5]); # x2
    $macror_in->y2($src2_array[6]); # y2
    push @macror_array, $macror_in;
  }
  elsif ( $src2_array[0] =~ /^###MAINLEF/) {
    $mainlef_name=$src2_array[1];
  }
  elsif ( $src2_array[0] =~ /^###PITCH_X/) {
    $pitch_x=$src2_array[1];
  }
  elsif ( $src2_array[0] =~ /^###PITCH_Y/) {
    $pitch_y=$src2_array[1];
  }
  elsif ( $src2_array[0] =~ /^###XPIN_GAP/) {
    $xpin_gap=$src2_array[1];
  }
  elsif ( $src2_array[0] =~ /^###YPIN_GAP/) {
    $ypin_gap=$src2_array[1];
  }
  elsif ( $src2_array[0] =~ /^###PIN_POS/) {
    $pin_pos=$src2_array[1];
  }


}

close($IPLOC1);
