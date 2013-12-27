#!/usr/bin/perl

## RefMarkup.pl
## theosref weird markup parser.

$text = "<link href=\"../theosref.css\" rel=\"stylesheet\">\n\n";
while (<>) { $text .= $_; }

# [THEOSREF] Change %INDENT% to css indent.
$text =~ s/%INDENT%\n/<div class="indent">/g;
$text =~ s/\R%INDENTEND%/<\/div>/g;

# Fix %CODE%
$text =~ s/%CODE%\R/<div class="indent"><code style="display:block;">/g;
$text =~ s/\R%CODEEND%/<\/code><\/div>/g;

# [THEOSREF] %R%/%L% shit.
$text =~ s/%R%/<span class="readonly">read-only<\/span>/g;
$text =~ s/%S%/<span class="scope">system<\/span>/g;
$text =~ s/%C%/<span class="scope">command-line<\/span>/g;
$text =~ s/%L%/<span class="scope">local<\/span>/g;
$text =~ s/%D%/<span class="deprecated">deprecated<\/span>/g;

print $text;
