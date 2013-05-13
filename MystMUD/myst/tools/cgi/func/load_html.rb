
def load_html(file_source, variables)
	script = File.open(file_source)
	script.set_encoding 'UTF-8'
	html = script.read
	script.close
	html.gsub! /(<\?\s*var\s+(\w+)\s*\?>)/i do
		(variables[$2] ? variables[$2].to_s : $1)
	end
end
