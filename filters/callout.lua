-- callout.lua: ::: {.callout type="note|warning|tip"} -> tcolorbox / html div
-- Coloured box only, no label or icon rendered.
local colors = { note="blue!10!white", warning="red!10!white", tip="green!10!white" }
local html_colors = { note="#1a3a5c", warning="#5c1a1a", tip="#1a4a2a" }

function Div(el)
  -- callout handler
  if el.classes:includes("callout") then
    local kind  = el.attributes["type"] or "note"
    local color = colors[kind] or "gray!10!white"
    if FORMAT:match("latex") then
      local inner = pandoc.write(pandoc.Pandoc(el.content), "latex")
      return pandoc.RawBlock("latex",
        "\\begin{tcolorbox}[colback="..color..",colframe="..color..",breakable]\n"..
        inner.."\n\\end{tcolorbox}")
    elseif FORMAT:match("html") then
      local border = html_colors[kind] or "#444"
      el.attributes["style"] = "border-left:4px solid "..border..
        ";padding:.5em 1em;background:#161b22;margin:1em 0"
      return el
    end
  end

  -- contact footer handler
  if el.classes:includes("contact-footer") then
    local inner = pandoc.utils.stringify(el)
    if FORMAT:match("latex") then
      return pandoc.RawBlock("latex",
        "\\vspace{1em}\\noindent\\rule{\\linewidth}{0.4pt}\\\\\n"..
        "\\small "..inner)
    elseif FORMAT:match("html") then
      el.attributes["style"] =
        "display:flex;justify-content:space-between;"..
        "font-size:0.85em;border-top:1px solid #444;"..
        "padding-top:0.5em;margin-top:2em;color:#aaa"
      return el
    end
  end
end
