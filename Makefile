LATEX_PATH    = $(shell if [[ "`hostname`" == *".cas.usf.edu" ]]; then echo "/usr/local/texlive/2012/bin/x86_64-darwin/"; else if [[ "`uname`" == "Linux" ]]; then echo "" ; else echo "/sw64/bin/"; fi)
DVIPDF_PATH   = $(shell if ["`uname'" == "Linux" ]]; then echo ""; else echo "/usr/local/bin/"; fi)

LATEX_CMD     = $(LATEX_PATH)latex
PDFLATEX_CMD  = $(LATEX_PATH)pdflatex
BIBTEX_CMD    = $(LATEX_PATH)bibtex
DVIPDF_CMD    = $(DVI_PDF_PATH)dvipdf

RM_CMD        = rm -fv

DVIPDF_FLAGS  = -dAutoRotatePages=/None

FIGURES_DIR   = ./figures

COMPRESS_OUT    = ~/etherlipidpaper.tar.gz
COMPRESS_FLAGS  = czvf 
COMPRESS        = tar

all: paper.pdf

abstract.pdf: abstract.dvi
	$(DVIPDF_CMD) $(DVIPDF_FLAGS) $< $@
paper.pdf: paper.dvi
	$(DVIPDF_CMD) $(DVIPDF_FLAGS) $< $@
figures.pdf: figures.dvi
	$(DVIPDF_CMD) $(DVIPDF_FLAGS) $< $@

figures.dvi: figures.tex refs.bib figures
	$(LATEX_CMD) figures.tex
#	$(BIBTEX_CMD) abstract
	$(LATEX_CMD) figures.tex
	$(LATEX_CMD) figures.tex
abstract.dvi: abstract.tex refs.bib figures
	$(LATEX_CMD) abstract.tex
#	$(BIBTEX_CMD) abstract
	$(LATEX_CMD) abstract.tex
	$(LATEX_CMD) abstract.tex
paper.dvi: paper.tex refs.bib figures
	$(LATEX_CMD) paper.tex
	$(BIBTEX_CMD) paper
	$(LATEX_CMD) paper.tex
	$(LATEX_CMD) paper.tex

figures:  
	$(MAKE) -C $(FIGURES_DIR)


clean: cleantex
	$(RM_CMD) ./*.pdf ./*.bbl      ./*.blg      ./*.dvi      ./*.log
	$(RM_CMD) paper.dvi
	$(RM_CMD) figures/*.eps
	$(RM_CMD) figures/*.png
	$(RM_CMD) figures/*.pdf

cleantex:
	$(RM_CMD) paper.log

tar: paper.pdf
	$(RM_CMD) $(COMPRESS_OUT)
	$(COMPRESS) $(COMPRESS_FLAGS) $(COMPRESS_OUT) ./

.PHONY: figures
