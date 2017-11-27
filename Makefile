VERSION := 2

all : link build check compress
.PHONY: all link build check compress

link :
	ln -sf ../extra/ADASS2017_author_template/asp2014.bst ./P3-140/asp2014.bst
	ln -sf ../extra/ADASS2017_author_template/asp2014.sty ./P3-140/asp2014.sty
	ln -sf ../extra/ADASS2017_author_template/ADASS_template.tex ./P3-140/ADASS_template.tex
	ln -sf ../extra/ADASS2017_author_template/AdassChecks.py ./P3-140/AdassChecks.py
	ln -sf ../extra/ADASS2017_author_template/PaperCheck.py ./P3-140/PaperCheck.py
	ln -sf ../extra/ADASS2017_author_template/TexScanner.py ./P3-140/TexScanner.py

check :
	cd ./P3-140;python PaperCheck.py P3-140 Peterson

build : link
	cd ./P3-140;latex -output-format=pdf ./P3-140.tex
	cd ./P3-140;bibtex P3-140.aux
	cd ./P3-140;latex -output-format=pdf ./P3-140.tex
	cd ./P3-140;latex -output-format=pdf ./P3-140.tex

clean :
	rm -f ./P3-140/asp2014.bst
	rm -f ./P3-140/asp2014.sty
	rm -f ./P3-140/ADASS_template.tex
	rm -f ./P3-140/P3-140.aux
	rm -f ./P3-140/P3-140.bbl
	rm -f ./P3-140/P3-140.blg
	rm -f ./P3-140/P3-140.dvi
	rm -f ./P3-140/P3-140.log
	rm -f ./P3-140/P3-140.out
	rm -f ./P3-140/P3-140_f1-eps-converted-to.pdf
	rm -f ./P3-140/AdassChecks.py
	rm -f ./P3-140/PaperCheck.py
	rm -f ./P3-140/TexScanner.py
	rm -f ./P3-140/*.pyc
	rm -f extra/ADASS2017_author_template/*.pyc

compress : clean
	cp ./P3-140/P3-140.pdf ./P3-140v$(VERSION).pdf
	tar -cvzf P3-140_v$(VERSION).tar.gz P3-140
