-- callout.lua: ::: {.callout type="note|warning|tip"} -> mdframed / html div
-- Coloured box only, no label or icon rendered.

function Div(el)
  if FORMAT:match("latex") then
    local cls = el.classes[1] or ""

    if cls == "callout" or cls == "contact-footer" then
      local t = el.attributes.type or ""
      if cls == "callout" and t == "" then t = "note" end
      local env = cls == "contact-footer" and "contact-footer" or ("callout-" .. t)

      local blocks = { pandoc.RawBlock("latex", "\\begin{" .. env .. "}") }
      for _, b in ipairs(el.content) do
        table.insert(blocks, b)
      end
      table.insert(blocks, pandoc.RawBlock("latex", "\\end{" .. env .. "}"))

      return blocks
    end
  elseif FORMAT:match("html") then
    local html_colors = { note="#1a3a5c", warning="#5c1a1a", tip="#1a4a2a" }

    if el.classes:includes("callout") then
      local kind = el.attributes["type"] or "note"
      local border = html_colors[kind] or "#444"
      el.attributes["style"] = "border-left:4px solid "..border..
        ";padding:.5em 1em;background:#161b22;margin:1em 0"
      return el
    elseif el.classes:includes("contact-footer") then
      el.attributes["style"] =
        "display:flex;justify-content:space-between;"..
        "font-size:0.85em;border-top:1px solid #444;"..
        "padding-top:0.5em;margin-top:2em;color:#aaa"
      return el
    end
  end
end
