# Lua filters and Pandoc

[Binary Cache] re for my gitlab ci.


# Notes

GITLAB_TOKEN
as a Project Access Token with write_repository. The built-in CI_JOB_TOKEN can only read,
not push back to the repo.

``` bash
pandoc ${1%%.*}.org \
    --from=org --to=gfm \
    --output=${1%%.*}.md
    ```

# TexLive CI

scheme-full  ~4GB

In CI that 4GB gets downloaded and unpacked every run unless you cache the nix store. For your use case scheme-medium is
the sweet spot  it covers everything pandoc + LuaLaTeX needs. scheme-full would only save time if you were
constantly hitting missing packages from obscure CTAN packages, which you won't be with standard pandoc output.

# Lua filters

Lua globals are shared across dofile calls. Every filter that defines Meta = function(m) ... end silently clobbers the previous one. This main.lua collects each filter's Meta into a table and installs one final chained handler that runs all of them in order.
callout.lua injects tcolorbox, math-format.lua injects lualatex-math and mathtools, diagram.lua injects tikz  now all three will actually run.

In main.lua
Meta = nil before each dofile ensures we detect exactly which files define a Meta handler
Each one gets collected into meta_handlers
One final Meta is installed that runs all of them in sequence
All other handlers (Div, HorizontalRule, CodeBlock, Para) are globals and don't conflict \u2014 only Meta had the collision problem

What Meta does:
it processes the YAML front matter of your document. Filters use it to programmatically inject \usepackage{...} into the LaTeX preamble via header-includes. Without it, callout.lua can't load tcolorbox before the document body uses it.

[Binary Cache]: https://app.cachix.org/cache/pandoc-lua-filters

# Git CI Notes

Keep CI files, flake, and content changes in separate commits, so when a build breaks, I  can `git bisect` or `revert`
just the flake without losing content work.
One rule: never mix a rename with a config change in the same commit.
