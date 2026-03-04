-- math-format.lua: consistent display math spacing + lualatex-math fixes
-- Requires: lualatex-math and mathtools in flake.nix texlive combine
local injected = false
function Meta(m)
  if FORMAT:match("latex") and not injected then
    injected = true
    local existing = m["header-includes"]
    local blocks = existing and existing.content or {}
    table.insert(blocks, pandoc.RawBlock("latex", [[
\usepackage{lualatex-math}
\usepackage{mathtools}
\setlength{\abovedisplayskip}{8pt}
\setlength{\belowdisplayskip}{8pt}
\setlength{\abovedisplayshortskip}{4pt}
\setlength{\belowdisplayshortskip}{4pt}
]]))
    m["header-includes"] = pandoc.MetaBlocks(blocks)
  end
  return m
end