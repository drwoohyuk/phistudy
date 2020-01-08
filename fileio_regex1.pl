
my $row_count= 0;
my $instance;
my $llx;
my $lly;
my $urx;
my $ury;
my $orient;
my $row;

while (my $line = <$fpl1>) {
  chomp $line;

  $line =~ /^[ \t]*([^ ]+)[ \t]+([^ ]+)[ \t]+([^ ]+)[ \t]+([^ ]+)[ \t]+([^ ]+)[ \t]+([^ ]+)[ \t]+([^ ]+)/;

  $instance= $1;
  $llx= $2;
  $lly= $3;
  $urx= $4;
  $ury= $5;
  $orient= $6;
  $row= $7;

