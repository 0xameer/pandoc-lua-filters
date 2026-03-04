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
HTML_FLAGS := --standalone --to=html5

.PHONY: all pdf html watch clean
all: pdf html

pdf: system-design.pdf resume.pdf
html: system-design.html resume.html

system-design.pdf: system-design.md filters/*.lua preamble.tex
	$(PANDOC) $< $(FILTERS) $(FLAGS) -o $@
	@echo "Built $@"

resume.pdf: resume.md filters/*.lua preamble.tex
	$(PANDOC) $< $(FILTERS) $(FLAGS) -o $@
	@echo "Built $@"

system-design.html: system-design.md filters/*.lua
	$(PANDOC) $< $(FILTERS) $(HTML_FLAGS) -o $@
	@echo "Built $@"

resume.html: resume.md filters/*.lua
	$(PANDOC) $< $(FILTERS) $(HTML_FLAGS) -o $@
	@echo "Built $@"

watch:
	find . -name "*.md" -o -name "*.lua" | entr -c make all

clean:
	rm -f *.pdf *.html *.aux *.log *.out
