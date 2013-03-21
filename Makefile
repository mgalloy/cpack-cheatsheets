TITLE=cpack-variables

RST2HTML=rst2html.py
RST2HTML_OPTIONS=

RST2LATEX=rst2latex.py
RST2LATEX_OPTIONS=--stylesheet=cpack --documentoptions=8pt --documentclass=extarticle --literal-block-env=idlcode

LATEX=xelatex
LATEX_OPTIONS=--halt-on-error

.PHONY: all clean

all: $(TITLE).html $(TITLE).pdf

$(TITLE).html: $(TITLE).rst
	$(RST2HTML) $(RST2HTML_OPTIONS) $(TITLE).rst > $(TITLE).html

$(TITLE).tex: $(TITLE).rst
	$(RST2LATEX) $(RST2LATEX_OPTIONS) $(TITLE).rst > $(TITLE).tex

$(TITLE).pdf: $(TITLE).tex
	$(LATEX) $(LATEX_OPTIONS) $(TITLE).tex
	$(LATEX) $(LATEX_OPTIONS) $(TITLE).tex

clean:
	rm -f $(TITLE).html
	rm -f $(TITLE).{pdf,tex,aux,log,out}


