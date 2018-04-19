package UnicodeEscape::Tags;

use strict;
use warnings;

sub _filter_modifier {
    my ( $text, $arg ) = @_;
    return $text if $arg != 1;
    return escape($text);
}

sub escape {
  use Encode;
  my @str = split //, $_[0];
  my $str_escape;
  for (@str) {
    $str_escape .= '\u';
    $str_escape .= unpack('H*', encode('UTF16BE', $_));
  }
  my $text = $str_escape;
}


1;
