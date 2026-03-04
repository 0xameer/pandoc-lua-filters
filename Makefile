# Makefile \u2014 batch process all markdown/ -> output/ (PDF + HTML)
PANDOC    := pandoc
FILTERS   := --lua-filter=filters/main.lua
FLAGS     := --pdf-engine=lualatex \
             --standalone \
             -V documentclass=article \
             -V mainfont="Noto Serif" \
             -V sansfont="Noto Sans" \
             -V monofont="Noto Sans Mono" \
             --highlight-style=zenburn \
             --include-in-header=preamble.tex
HTML_FLAGS := --standalone --to=html5

SRCS     := $(wildcard markdown/*.md)
PDFS     := $(patsubst markdown/%.md, output/%.pdf, $(SRCS))
HTMLS    := $(patsubst markdown/%.md, output/%.html, $(SRCS))

.PHONY: all pdf html watch clean
all: pdf html

pdf:  $(PDFS)
html: $(HTMLS)

output/%.pdf: markdown/%.md filters/*.lua preamble.tex | output
	$(PANDOC) $< $(FILTERS) $(FLAGS) -o $@
	@echo "Built $@"

output/%.html: markdown/%.md filters/*.lua | output
	$(PANDOC) $< $(FILTERS) $(HTML_FLAGS) -o $@
	@echo "Built $@"

output:
	mkdir -p output

watch:
	find markdown filters -name "*.md" -o -name "*.lua" | entr -c make all

clean:
	rm -rf output
