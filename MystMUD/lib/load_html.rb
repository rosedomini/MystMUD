require '../lib/file_utf8'

def load_html file, print = nil
 html = File.read_utf8 file
 html[1] == '<' and html.slice!(0) # UTF-8 BOM
 while i = html =~ /([^ ](\n?)([ \t]*)(<%\s*(\w|\w+[\w ]*\w+)\s*%>))/i
  print html.slice!(0, i+1)
  html.slice!(0..$1.size-2)
  print $2.empty? ? $3 : "\n"
  if print then print yield $5 else yield $5 end
 end
 print html
end