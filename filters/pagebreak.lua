-- pagebreak.lua
-- Horizontal rules (--- in Markdown) trigger page breaks in LaTeX/HTML.
-- Also handles explicit \newpage or \pagebreak text.

function HorizontalRule()
  if FORMAT:match("latex") then
    return pandoc.RawBlock("latex", "\\newpage")
  elseif FORMAT:match("html") then
    return pandoc.RawBlock("html",
      '<hr style="page-break-after:always;visibility:hidden">')
  end
end

function Para(el)
  if #el.content == 1 and el.content[1].t == "Str" then
    local txt = el.content[1].text
    if txt == "\\newpage" or txt == "\\pagebreak" then
      if FORMAT:match("latex") then
        return pandoc.RawBlock("latex", "\\newpage")
      elseif FORMAT:match("html") then
        return pandoc.RawBlock("html",
          '<div style="page-break-after: always;"></div>')
      end
    end
  end
end
