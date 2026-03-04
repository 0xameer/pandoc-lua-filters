-- main.lua: loads all filters
-- Packages are declared in document YAML front matter, not injected by filters.
-- Usage: pandoc doc.md --lua-filter=filters/main.lua
-- no meta chaining see readme.

local dir = PANDOC_SCRIPT_FILE:match("(.*[/\\])")
dofile(dir .. "callout.lua")
dofile(dir .. "typographer.lua")
dofile(dir .. "wordcount.lua")
dofile(dir .. "anchors.lua")
dofile(dir .. "pagebreak.lua")
dofile(dir .. "linenum.lua")
dofile(dir .. "math-format.lua")
dofile(dir .. "diagram.lua")
dofile(dir .. "include-files.lua")
