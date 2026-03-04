-- diagram.lua: fenced tikz blocks -> LaTeX figure
-- Example:
--   ```tikz
--   \draw (0,0) -- (1,1);
--   ```
-- For category theory use tikz-cd arrows inside the block
-- Requires: tikz, tikz-cd in flake.nix texlive combine
local tikz_injected = false
function CodeBlock(el)
  if not el.classes:includes("tikz") then return nil end
  if FORMAT:match("latex") then
    return pandoc.RawBlock("latex",
      "\\begin{figure}[h]\n\\centering\n" ..
      "\\begin{tikzpicture}\n" ..
      el.text ..
      "\n\\end{tikzpicture}\n\\end{figure}")
  end
end
function Meta(m)
  if FORMAT:match("latex") and not tikz_injected then
    tikz_injected = true
    local existing = m["header-includes"]
    local blocks = existing and existing.content or {}
    table.insert(blocks, pandoc.RawBlock("latex",
      "\\usepackage{tikz}\n\\usepackage{tikz-cd}"))
    m["header-includes"] = pandoc.MetaBlocks(blocks)
  end
  return m
end