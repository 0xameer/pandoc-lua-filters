# Makefile for pandoc + lua-filters -> PDF via LuaLaTeX
# Usage: make           -> example.pdf
#        make watch     -> rebuild on change (requires entr)
#        make clean     -> remove outputs
#        make html      -> example.html
PANDOC   := pandoc
FILTERS  := --lua-filter=filters/main.lua
FLAGS    := --pdf-engine=lualatex \
            --standalone \
            -V documentclass=article \
            -V mainfont="Noto Serif" \
            -V sansfont="Noto Sans" \
            -V monofont="Noto Sans Mono" \
            --highlight-style=zenburn \
            --include-in-header=preamble.tex
SRCS     := example.md
PDF_OUT  := example.pdf
HTML_OUT := example.html

.PHONY: all pdf html watch clean
all: pdf

pdf: $(PDF_OUT)
$(PDF_OUT): $(SRCS) filters/*.lua
	$(PANDOC) $(SRCS) $(FILTERS) $(FLAGS) -o $@
	@echo "Built $@"

html: $(HTML_OUT)
$(HTML_OUT): $(SRCS) filters/*.lua
	$(PANDOC) $(SRCS) $(FILTERS) --standalone --to=html5 -o $@
	@echo "Built $@"

watch:
	find . -name "*.md" -o -name "*.lua" | entr -c make pdf

clean:
	rm -f $(PDF_OUT) $(HTML_OUT) *.aux *.log *.out
