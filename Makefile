# Makefile for LaTeX project with pandoc for HTML output

# Variables
TEXFILE = main.tex
BIBFILE = references.bib
OUTPUT_DIR = output

# Default target
all: pdf html docx

# PDF target
pdf:
	pdflatex $(TEXFILE)
	biber main
	pdflatex $(TEXFILE)
	pdflatex $(TEXFILE)

# HTML target using pandoc
html: $(TEXFILE) $(BIBFILE) | $(OUTPUT_DIR)
	pandoc $(TEXFILE) \
		--bibliography=$(BIBFILE) \
		--csl=apa.csl \
		--citeproc \
		--standalone \
		-o $(OUTPUT_DIR)/main.html

# DOCX target
docx: $(BIBFILE) | $(OUTPUT_DIR)
	pandoc $(TEXFILE) --output=$(OUTPUT_DIR)/main.docx --bibliography=$(BIBFILE) --csl=apa.csl --metadata-file=metadata.yaml

# Clean target
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.run.xml
	rm -rf $(OUTPUT_DIR)

# Ensure output directory exists
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)