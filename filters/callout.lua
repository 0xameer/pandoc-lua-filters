-- callout.lua: ::: {.callout type="note|warning|tip"} -> tcolorbox / html div
local colors = { note="blue!10!white", warning="red!10!white", tip="green!10!white" }
local icons  = { note="i", warning="!", tip=">" }
function Div(el)
  if not el.classes:includes("callout") then return nil end
  local kind  = el.attributes["type"] or "note"
  local color = colors[kind] or "gray!10!white"
  local icon  = icons[kind]  or "?"
  local label = kind:sub(1,1):upper() .. kind:sub(2)
  if FORMAT:match("latex") then
    local inner = pandoc.write(pandoc.Pandoc(el.content), "latex")
    return pandoc.RawBlock("latex",
      "\\begin{tcolorbox}[colback="..color..",colframe="..color..
      ",fonttitle=\\bfseries,title={"..icon.." "..label.."},breakable]\n"..
      inner.."\n\\end{tcolorbox}")
  elseif FORMAT:match("html") then
    el.attributes["style"] = "border-left:4px solid #58a6ff;padding:.5em 1em;background:#161b22"
    table.insert(el.content, 1, pandoc.Para({pandoc.Strong({pandoc.Str(icon.." "..label)})}))
    return el
  end
end
function Meta(m)
  if FORMAT:match("latex") then
    m["header-includes"] = pandoc.MetaBlocks({
      pandoc.RawBlock("latex","\\usepackage[skins,breakable]{tcolorbox}")
    })
  end
  return m
end
