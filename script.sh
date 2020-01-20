#! /bin/bash
user="/Users/telliott"
path=$user"/Github/number_theory"

cd /Users/telliott/Desktop

python $path/combine.py > IF.tex
# once to generate .sty, twice for TOC, 3x for ref nums
pdflatex IF.tex >/dev/null
pdflatex IF.tex >/dev/null
pdflatex IF.tex >/dev/null

pdf_path=$path/Basic\ Number\ Theory.pdf

mv IF.pdf "$pdf_path"
rm IF.*
sleep 1

osascript -e 'quit app "TeXShop"'

# cleanup random stuff
rm $path/files/*.aux $path/files/*.log 2>/dev/null
rm $path/files/*.out $path/files/*.gz 2>/dev/null
rm $path/files/*.pdf 2>/dev/null
rm stdclsdv.sty 2>/dev/null

open -a Preview "$pdf_path"


