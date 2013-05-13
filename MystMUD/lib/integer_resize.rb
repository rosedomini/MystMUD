class Integer
 def resize size
  s = to_s
  "#{'0'*(size-s.size) if size > s.size}#{s}"
 end
end