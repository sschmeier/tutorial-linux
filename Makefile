# Makefile for Sphinx documentation
#
# Makefile for Sphinx documentation
#
PREFIX = SphinxTemplate

# You can set these variables from the command line.
SPHINXOPTS    = 
SPHINXBUILD   = sphinx-build
PAPER         =
# changed this to build page in a html dir in one dir up
BUILDDIR      = build

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  htmlwatch  uses watchdog to make html whenever rst is changed."
	@echo "  viewtex    open build latexpdf in new window"


.PHONY: html
html:
	sphinx-build -E source build/en/latest
	mv build/en/latest/sitemapindex.xml build
	mv build/en/latest/robots.txt build
	@echo
	@echo "Build finished. The HTML pages are in build."


.PHONY: view
view:
	open $(BUILDDIR)/en/latest/index.html


.PHONY: htmlwatch
htmlwatch:
	watchmedo shell-command --patterns="*.md;*.rst" --ignore-pattern='build/*' --recursive --command='make html'


.PHONY: deploy
deploy:
	make latexpdf
	yes | cp -f build/latex/$(PREFIX).pdf source/_static/
	git add -u
	git commit -m "Updated pdf"
	bump2version patch
	git push


.PHONY: latexpdf
latexpdf:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo "Running LaTeX files through pdflatex..."
	$(MAKE) -C $(BUILDDIR)/latex all-pdf
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."


.PHONY: viewtex
viewtex:
	open $(BUILDDIR)/latex/*.pdf
