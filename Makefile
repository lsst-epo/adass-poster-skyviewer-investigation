.PHONY: all clean link check build compress cleancompress
VERSION := 2

all : clean link build check compress

link :
	ln -sf ../extra/ADASS2017_author_template/asp2014.bst ./P1-140/asp2014.bst
	ln -sf ../extra/ADASS2017_author_template/asp2014.sty ./P1-140/asp2014.sty
	ln -sf ../extra/ADASS2017_author_template/ADASS_template.tex ./P1-140/ADASS_template.tex
	ln -sf ../extra/ADASS2017_author_template/AdassChecks.py ./P1-140/AdassChecks.py
	ln -sf ../extra/ADASS2017_author_template/PaperCheck.py ./P1-140/PaperCheck.py
	ln -sf ../extra/ADASS2017_author_template/TexScanner.py ./P1-140/TexScanner.py

check :
	cd ./P1-140;python PaperCheck.py P1-140 Peterson

build : link
	cd ./P1-140;latex -output-format=pdf ./P1-140.tex
	cd ./P1-140;bibtex P1-140.aux
	cd ./P1-140;latex -output-format=pdf ./P1-140.tex
	cd ./P1-140;latex -output-format=pdf ./P1-140.tex

clean :
	rm -f ./P1-140/asp2014.bst
	rm -f ./P1-140/asp2014.sty
	rm -f ./P1-140/ADASS_template.tex
	rm -f ./P1-140/P1-140.aux
	rm -f ./P1-140/P1-140.bbl
	rm -f ./P1-140/P1-140.blg
	rm -f ./P1-140/P1-140.dvi
	rm -f ./P1-140/P1-140.log
	rm -f ./P1-140/P1-140.out
	rm -f ./P1-140/P1-140_f1-eps-converted-to.pdf
	rm -f ./P1-140/AdassChecks.py
	rm -f ./P1-140/PaperCheck.py
	rm -f ./P1-140/TexScanner.py
	rm -f ./P1-140/*.pyc
	rm -f extra/ADASS2017_author_template/*.pyc

cleancompress :
	rm -f ./P1-140/asp2014.bst
	rm -f ./P1-140/asp2014.sty
	rm -f ./P1-140/ADASS_template.tex
	rm -f ./P1-140/P1-140.aux
	rm -f ./P1-140/P1-140.bbl
	rm -f ./P1-140/P1-140.blg
	rm -f ./P1-140/P1-140.dvi
	rm -f ./P1-140/P1-140.log
	rm -f ./P1-140/P1-140.out
	rm -f ./P1-140/P1-140_f1-eps-converted-to.pdf
	rm -f ./P1-140/AdassChecks.py
	rm -f ./P1-140/PaperCheck.py
	rm -f ./P1-140/TexScanner.py
	rm -f ./P1-140/*.pyc
	rm -f extra/ADASS2017_author_template/*.pyc

compress : cleancompress
	tar -cvzf P1-140_v$(VERSION).tar.gz P1-140
