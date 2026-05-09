-- pagebreak.lua
-- Horizontal rules become minimal section separators.
-- Explicit \newpage and \pagebreak still work.

function HorizontalRule()
  if FORMAT:match("latex") then
    return pandoc.RawBlock(
      "latex",
      [[
\vspace{0.4em}
\begin{center}
{\small\textcolor{gray}{·\ \ ·\ \ ·}}
\end{center}
\vspace{0.2em}
]]
    )

  elseif FORMAT:match("html") then
    return pandoc.RawBlock(
      "html",
      [[
<div style="text-align:center; margin:0.5em 0; color:#888;">
🖧
</div>
]]
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
