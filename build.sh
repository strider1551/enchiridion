#! /bin/bash

cd tex

xelatex -interaction="batchmode" "enchiridion-letterpaper.tex"
xelatex -interaction="batchmode" "enchiridion-letterpaper.tex"
mv "enchiridion-letterpaper.pdf" ../build/
xelatex -interaction="batchmode" "enchiridion-a4paper.tex"
xelatex -interaction="batchmode" "enchiridion-a4paper.tex"
mv "enchiridion-a4paper.pdf" ../build/
xelatex -interaction="batchmode" "enchiridion-ebook.tex"
xelatex -interaction="batchmode" "enchiridion-ebook.tex"
mv "enchiridion-ebook.pdf" ../build/

mv *.log ../build/logs

rm -f *.aux *.dvi *.bbl *.blg *.ilg *.toc *.lof *.lot *.idx *.ind *.d *.out *-blx.bib *.run.xml *.bcf *.maf *.mtc* *.stc*
