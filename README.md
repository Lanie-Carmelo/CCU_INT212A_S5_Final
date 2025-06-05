# APA 7 Student Paper LaTeX Template

This repository provides a ready-to-use template for APA 7th edition student papers, written in LaTeX. It includes:

- `main.tex`: Starter document using the `apa7` class and `biblatex` for references.
- `apa.csl`: Citation Style Language file for APA 7th edition (for Pandoc/other tools).
- `metadata.yaml`: Metadata for Pandoc or workflow automation.
- `Makefile`: Build system for PDF, HTML, and DOCX outputs.
- `.gitignore`: Ignores LaTeX build artifacts and editor backups.
- `LICENSE`: MIT License.

## Getting Started

1. **Install LaTeX** (TeX Live, MikTeX, etc.) and [Biber](https://ctan.org/pkg/biber).
2. **Clone this repo** and add your content to `main.tex`.
3. **Add your references** to `references.bib` (see [Using Zotero](#using-zotero-for-references) below).
4. **Build your document** (see [Build Process](#build-process)).

## Build Process

The provided `Makefile` automates the process of compiling the LaTeX document and generating outputs in different formats.  
**Note:** This template uses `biblatex` with the `biber` backend (not BibTeX).

- **PDF**:  
  Run `make pdf` to compile the LaTeX document into a PDF.  
  This runs the following commands in order:
  1. `pdflatex main.tex`
  2. `biber main`
  3. `pdflatex main.tex` (twice for cross-references)

- **HTML**:  
  Run `make html` to convert the LaTeX document into HTML format using Pandoc.

- **DOCX**:  
  Run `make docx` to convert the LaTeX document into a DOCX format using Pandoc.

All outputs are placed in the `output/` directory.

### Manual Build Steps

If you are not using the Makefile, compile your document with:

```sh
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

**Do not use `bibtex`—this template requires `biber` for bibliography processing.**

## Overleaf Compatibility

This template works with [Overleaf](https://www.overleaf.com/):

- Upload all files (`main.tex`, `references.bib`, etc.) to your Overleaf project.
- In Overleaf, set the bibliography backend to **biber** (go to Menu → Settings → Compiler → Biber).
- Overleaf automatically runs the correct sequence (`pdflatex → biber → pdflatex → pdflatex`).
- You can manage your bibliography in `references.bib` as usual.

## Using Zotero for References

You can use [Zotero](https://www.zotero.org/) to manage your references and export them to BibLaTeX format:

1. Select your references in Zotero.
2. Right-click and choose **Export Items**.
3. Select **BibLaTeX** as the format and save as `references.bib`.
4. Replace or merge with the existing `references.bib` in this repository.

For best results, use the [Better BibTeX](https://retorque.re/zotero-better-bibtex/) Zotero plugin, which improves citation key generation and export options.

## Customization

- Edit `metadata.yaml` for Pandoc-based workflows.
- Update the document metadata in `main.tex` (`\title`, `\author`, etc.).
- Use the `apa7` class options as needed.

## Troubleshooting

If you encounter issues:

1. **Check LaTeX Installation**: Ensure you have a working LaTeX installation (TeX Live, MikTeX, etc.) and that all required packages are installed.
2. **Biber Issues**: If you have problems with citations or bibliography, make sure Biber is installed and properly configured.
3. **Log Files**: Check the `.log` files generated during the build process for error messages and warnings.
4. **Overleaf**: Ensure the bibliography tool is set to Biber in project settings.
5. **Ask for Help**: If you're stuck, consider asking for help on forums like Stack Exchange or the LaTeX community.

## License

MIT License.
