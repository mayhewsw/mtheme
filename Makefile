SRC = rdsm2015-presentation.tex
PDF = rdsm2015-presentation.pdf
AUX = rdsm2015-presentation.aux
TEXC := xelatex
TEXC_OPTS += -shell-escape
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/mtheme

.PHONY: clean install

all: $(PDF)

$(AUX):
	$(TEXC) $(TEXC_OPTS) $(SRC)

$(PDF): beamerthemem.sty $(AUX) $(SRC)
	$(TEXC) $(TEXC_OPTS) $(SRC)

clean:
	@rm -f $(PDF)

install:
	mkdir -p $(INSTALL_DIR)
	cp *.sty $(INSTALL_DIR)
