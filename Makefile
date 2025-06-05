# Makefile for LaTeX project with lwarp for HTML output

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

# HTML target using lwarp
html: $(TEXFILE) $(BIBFILE)
    lwarpmk html
    mkdir -p $(OUTPUT_DIR)
    cp *.html *.css *.svg *.png *.jpg *.gif $(OUTPUT_DIR) 2>/dev/null || true

# DOCX target (still uses pandoc)
docx: $(BIBFILE)
    pandoc $(TEXFILE) --output=$(OUTPUT_DIR)/main.docx --bibliography=$(BIBFILE) --csl=apa.csl --metadata-file=metadata.yaml

# Clean target
clean:
    rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.run.xml *.html *.css *.svg *.png *.jpg *.gif
    rm -rf $(OUTPUT_DIR)

# Ensure output directory exists
$(OUTPUT_DIR):
    mkdir -p $(OUTPUT_DIR)