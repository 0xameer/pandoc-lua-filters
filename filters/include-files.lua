-- include-files.lua: splice another markdown file inline
-- In markdown write a paragraph with only: !include relative/path.md
function Para(el)
  if #el.content == 1 and el.content[1].t == "Str" then
    local path = el.content[1].text:match("^!include%s+(.+)$")
    if path then
      local fh = io.open(path, "r")
      if not fh then
        io.stderr:write("include-files: cannot open " .. path .. "\n")
        return nil
      end
      local content = fh:read("*a")
      fh:close()
      return pandoc.read(content, "markdown").blocks
    end
  end
end