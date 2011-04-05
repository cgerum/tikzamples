TEXFILES := $(wildcard *.tex)
PDFFILES := $(TEXFILES:%.tex=%.pdf)
DVIFILES := $(TEXFILES:%.tex=%.dvi)
PSFILES := $(TEXFILES:%.tex=%.ps)
PNGFILES := $(TEXFILES:%.tex=%.png)
SVGFILES := $(TEXFILES:%.tex=%.svg)

.PHONY: all
all: pdf

.PHONY: pdf
pdf: $(PDFFILES)

.PHONY: ps
ps: $(PSFILES)

.PHONY: dvi
dvi: $(DVIFILES)

.PHONY: svg
svg: $(SVGFILES)

.PHONY: png
png: $(PNGFILES)

%.pdf: %.tex
	pdflatex $<

%.ps:%.dvi
	dvips $<

%.dvi:%.tex
	latex $<  

%.svg: %.pdf
	convert $< $@ 

%.png: %.pdf
	convert -density 300x300 $< $@ 

.PHONY: echo
echo:
	@echo "TEXFILES = " $(TEXFILES)
	@echo "PDFFILES = " $(PDFFILES)
	@echo "DVIFILES = " $(DVIFILES)
	@echo "PSFILES = " $(PSFILES)
	@echo "SVGFILES = " $(SVGFILES)
	@echo "PNGFILES = " $(PNGFILES)

.PHONY: clean
clean:
	@rm -rf $(PDFFILES)
	@rm -rf $(DVIFILES)
	@rm -rf $(PSFILES)
	@rm -rf $(PNGFILES)
	@rm -rf $(SVGFILES)
	@rm -rf all-*.png

.PHONY: ultraclean
ultraclean: clean
	@rm -rf *~
	@rm -rf *.aux
	@rm -rf *.log
	@rm -rf *.idx
	@rm -rf *.out
	@rm -rf *.makefile
	@rm -rf pgfshell_*
	@rm -rf *.toc
	@rm -rf *.figlist