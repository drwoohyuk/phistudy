
my %PINCOLUMN_CONF = (
pl1name => '',
comp_ytop => '',
comp_ybot => '',
ypin_gap => '',
pitch_y => '',
pin_eastyoffset => '',
);
$PINCOLUMN_CONF{'pl1name'}=$pl1name;
$PINCOLUMN_CONF{'comp_ytop'} = $pin_ytop;
$PINCOLUMN_CONF{'comp_ybot'} = $pin_ybot;
$PINCOLUMN_CONF{'ypin_gap'} = $ypin_gap;
$PINCOLUMN_CONF{'pitch_y'} = $pitch_y;
$PINCOLUMN_CONF{'pin_eastyoffset'} = 0;

$pin_column=&get_pincolumn_pl1(\%PINCOLUMN_CONF);

print "PIN COLUMN ", $pin_column, "\n";
