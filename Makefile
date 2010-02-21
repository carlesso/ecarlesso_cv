UNAME=$(shell uname)

target = enrico_carlesso_cv
deps = Makefile $(target).tex

all: $(target).pdf

$(target).pdf: $(target).tex $(deps)
	pdflatex $(target).tex

.PHONY: clean view backup

clean:
	rm -f $(target).{aux,dvi,log,out,toc,lof,pdf} *.{1,mpx,mpo,log} tmpgraph* *.tmp mpgraph.mp *~

view: $(target).pdf
ifeq ($(UNAME),Darwin)
	open -a /Applications/Preview.app $(target).pdf
else
	xpdf $(target).pdf $(PAGE)
endif

backup:
	tar zcvf ../$(target)-backup.tar.gz .
