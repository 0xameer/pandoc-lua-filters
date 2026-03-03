-- anchors.lua: adds \label{sec:slug} to every LaTeX header
local function slugify(s)
  return s:lower():gsub("%s+","-"):gsub("[^%w%-]","")
end
function Header(el)
  if not FORMAT:match("latex") then return nil end
  local slug = slugify(pandoc.utils.stringify(el))
  el.content:insert(pandoc.RawInline("latex","\\label{sec:"..slug.."}"))
  return el
end
