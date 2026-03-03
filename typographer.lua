-- typographer.lua: smart punctuation for LuaLaTeX
function Str(el)
  if not FORMAT:match("latex") then return nil end
  local s = el.text
  s = s:gsub("%.%.%.", "\\ldots{}")
  s = s:gsub("%-%-%-", "---")
  s = s:gsub("%-%-",   "--")
  return pandoc.RawInline("latex", s)
end
