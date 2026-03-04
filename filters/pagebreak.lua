-- pagebreak.lua: converts HorizontalRule to \newpage in LaTeX
-- In markdown: use --- on its own line for a page break
function HorizontalRule()
  if FORMAT:match("latex") then
    return pandoc.RawBlock("latex", "\\newpage")
  elseif FORMAT:match("html") then
    return pandoc.RawBlock("html", '<hr style="page-break-after:always;visibility:hidden">')
  end
end