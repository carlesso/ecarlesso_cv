UNAME=$(shell uname)

target = enrico_carlesso_cv
target_en = enrico_carlesso_cv_en
deps = Makefile $(target).tex
deps_en = Makefile $(target_en).tex

all: it

it: $(target).pdf
en: $(target_en).pdf

$(target).pdf: $(target).tex $(deps)
	pdflatex $(target).tex

$(target_en).pdf: $(target_en).tex $(deps_en)
	pdflatex $(target_en).tex

.PHONY: clean view backup

clean:
	rm -f $(target).{aux,dvi,log,out,toc,lof,pdf} *.{1,mpx,mpo,log} tmpgraph* *.tmp mpgraph.mp *~
	rm -f $(target_en).{aux,dvi,log,out,toc,lof,pdf} *.{1,mpx,mpo,log} tmpgraph* *.tmp mpgraph.mp *~

view-it: $(target).pdf
ifeq ($(UNAME),Darwin)
	open -a /Applications/Preview.app $(target).pdf
else
	xpdf $(target).pdf $(PAGE)
endif

view-en: $(target_en).pdf
ifeq ($(UNAME),Darwin)
	open -a /Applications/Preview.app $(target_en).pdf
else
	xpdf $(target_en).pdf $(PAGE)
endif

