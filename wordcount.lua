-- wordcount.lua: counts words, injects as $wordcount$ in metadata
local count = 0
function Str(el)
  for _ in el.text:gmatch("%S+") do count = count + 1 end
end
function Meta(m)
  m["wordcount"] = pandoc.MetaString(tostring(count))
  return m
end
