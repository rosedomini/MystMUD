class String
 def js_escape
  s = gsub ?\\, '\\\\\\'
  s.gsub! ?", '\"'
  s.gsub! ?\a, '\a'
  s.gsub! ?\n, '\n'
  s.gsub! ?\r, '\r'
  s.gsub! ?\t, '\t'
  s
 end
 
 def js_escape!
  gsub! ?\\, '\\\\\\' and modified = true
  gsub! ?", '\"' and modified = true
  gsub! ?\a, '\a' and modified = true
  gsub! ?\n, '\n' and modified = true
  gsub! ?\r, '\r' and modified = true
  gsub! ?\t, '\t' and modified = true
  modified ? self : nil
 end
end