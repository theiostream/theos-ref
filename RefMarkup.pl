#!/usr/bin/perl

## RefMarkup.pl
## theosref weird markup parser.

$text = "<link href=\"../theosref.css\" rel=\"stylesheet\">\n\n";
while (<>) { $text .= $_; }

# [THEOSREF] Change %INDENT% to css indent.
$text =~ s/%INDENT%/<div class="indent">/g;
$text =~ s/%INDENTEND%/<\/div>/g;

# [THEOSREF] %R%/%L% shit.
$text =~ s/%R%/<span class="readonly">read-only<\/span>/g;
$text =~ s/%S%/<span class="scope">system<\/span>/g;
$text =~ s/%C%/<span class="scope">command-line<\/span>/g;
$text =~ s/%L%/<span class="scope">local<\/span>/g;
$text =~ s/%D%/<span class="deprecated">deprecated<\/span>/g;

print $text;
