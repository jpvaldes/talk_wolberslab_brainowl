PDF          = talk_braunlage.pdf
SRC          = talk_braunlage.tex
BIB          = talk_braunlage.bib
OUTPUT_DIR   := $(shell pwd)/latex-output
COMPILE      := latexmk -xelatex -output-directory=$(OUTPUT_DIR)

.PHONY: all pdf clean clean-output

all: pdf

help:
	@echo "Usage: \`make <target>' where <target> is one of"
	@echo "  pdf          to create the final presentation in PDF format"
	@echo "  clean        to delete all output from compilation, including presentation"
	@echo "  clean-output to delete all intermediate files from compilation"

pdf: $(PDF)

clean-output:
	@rm -rf "$(OUTPUT_DIR)"

clean: clean-output
	@rm -rf "$(PDF)"

$(OUTPUT_DIR):
	@mkdir -p $(OUTPUT_DIR)

$(PDF): $(SRC) $(BIB)
	$(COMPILE) $(SRC)
	@mv $(OUTPUT_DIR)/$(notdir $(PDF)) $(PDF)
