TEXFILES := $(wildcard *.tex)
PDFFILES := $(TEXFILES:%.tex=%.pdf)

all: $(PDFFILES)

%.pdf: %.tex
	pdflatex $<

echo:
	@echo "TEXFILES = " $(TEXFILES)
	@echo "PDFFILES = " $(PDFFILES)

clean:
	@rm -rf $(PDFFILES)