-- main.lua: loads all filters — use with --lua-filter=filters/main.lua
local dir = PANDOC_SCRIPT_FILE:match("(.*[/\\])")
dofile(dir .. "callout.lua")
dofile(dir .. "typographer.lua")
dofile(dir .. "wordcount.lua")
dofile(dir .. "anchors.lua")
