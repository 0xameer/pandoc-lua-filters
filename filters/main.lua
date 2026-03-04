-- main.lua: loads all filters, chains Meta functions to avoid overwrites
-- Drop-in replacement \u2014 usage unchanged:
--   pandoc doc.md --lua-filter=filters/main.lua
local dir = PANDOC_SCRIPT_FILE:match("(.*[/\\])")

local meta_handlers = {}

local function chain_meta(handlers)
  return function(m)
    for _, h in ipairs(handlers) do
      m = h(m) or m
    end
    return m
  end
end

local function load_and_collect(file)
  Meta = nil
  dofile(dir .. file)
  if Meta then
    table.insert(meta_handlers, Meta)
    Meta = nil
  end
end

load_and_collect("callout.lua")
load_and_collect("typographer.lua")
load_and_collect("wordcount.lua")
load_and_collect("anchors.lua")
load_and_collect("pagebreak.lua")
load_and_collect("linenum.lua")
load_and_collect("math-format.lua")
load_and_collect("diagram.lua")
load_and_collect("include-files.lua")

if #meta_handlers > 0 then
  Meta = chain_meta(meta_handlers)
end
