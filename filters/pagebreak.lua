-- pagebreak.lua
-- Only explicit \newpage or \pagebreak triggers page breaks.
-- Horizontal rules remain visual separators.

function HorizontalRule()
  if FORMAT:match("latex") then
    return pandoc.RawBlock("latex", "\\vspace{0.5em}\\hrule\\vspace{0.5em}")
  elseif FORMAT:match("html") then
    return pandoc.RawBlock(
      "html",
      "<hr>"
    )
  end
end

function Para(el)
  if #el.content == 1 and el.content[1].t == "Str" then
    local txt = el.content[1].text

    if txt == "\\newpage" or txt == "\\pagebreak" then
      if FORMAT:match("latex") then
        return pandoc.RawBlock("latex", "\\newpage")
      elseif FORMAT:match("html") then
        return pandoc.RawBlock(
          "html",
          '<div style="page-break-after: always;"></div>'
        )
      end
    end
  end
end
