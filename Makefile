all: science_cheatsheet.png

science_cheatsheet.pdf: science_cheatsheet.md
	pandoc science_cheatsheet.md --pdf-engine=xelatex -o science_cheatsheet.pdf
	pdfcrop $@ $@

science_cheatsheet.png: science_cheatsheet.pdf
	-mogrify -density 300 -format png -resize 2500x2500\> -background white -alpha remove -alpha off *.pdf
	echo done

clean:
	-@rm science_cheatsheet.pdf
	-@rm science_cheatsheet.png
