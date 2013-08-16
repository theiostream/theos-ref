#!/bin/bash

if [ ! -d "./output" ]; then mkdir output; fi

for x in *.md; do ./Markdown.pl $x | ./RefMarkup.pl > output/$x.html; done
