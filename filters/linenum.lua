-- linenum.lua: line numbers on fenced code blocks tagged with .linenum
-- Example: ```python .linenum
-- Requires: listings package in flake.nix
function CodeBlock(el)
  if not el.classes:includes("linenum") then return nil end
  local lang = el.classes[1] or "text"
  if FORMAT:match("latex") then
    return pandoc.RawBlock("latex",
      "\\begin{lstlisting}[language=" .. lang ..
      ",numbers=left,numberstyle=\\tiny,stepnumber=1,frame=single]\n" ..
      el.text .. "\n\\end{lstlisting}")
  end
end