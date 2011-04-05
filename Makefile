TEXFILES := $(wildcard *.tex)
PDFFILES := $(TEXFILES:%.tex=%.pdf)
DVIFILES := $(TEXFILES:%.tex=%.dvi)
PSFILES := $(TEXFILES:%.tex=%.ps)

.PHONY: all
all: pdf

.PHONY: pdf
pdf: $(PDFFILES)

.PHONY: ps
ps: $(PSFILES)


.PHONY: dvi
dvi: $(DVIFILES)

%.pdf: %.tex
	pdflatex $<

%.ps:%.dvi
	divps $<

%.dvi:%.tex
	latex $<  

echo:
	@echo "TEXFILES = " $(TEXFILES)
	@echo "PDFFILES = " $(PDFFILES)
	@echo "DVIFILES = " $(DVIFILES)
	@echo "PSFILES = " $(PSFILES)

clean:
	@rm -rf $(PDFFILES)
	@rm -rf $(DVIFILES)
	@rm -rf $(PSFILES)

ultraclean:
	@rm -rf *~
	@rm -rf *.aux
	@rm -rf *.log
	@rm -rf *.idx
	@rm -rf *.out
	@rm -rf *.makefile
	@rm -rf pgfshell_*
	@rm -rf *.toc
	@rm -rf *.figlist