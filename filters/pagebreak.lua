-- pagebreak.lua
-- Only \newpage or \pagebreak written as plain text trigger a page break.
-- Horizontal rules (--- in Markdown) are left as decorative dividers.

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

-- HorizontalRule renders as a thin decorative rule in LaTeX, <hr> in HTML.
-- No page break behaviour.
