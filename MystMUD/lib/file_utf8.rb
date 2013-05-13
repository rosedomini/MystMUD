class << File
	def read_utf8 name, *args
		file = File.open name, *args
		file.set_encoding 'utf-8'
		utf8_content = file.read
		file.close
		utf8_content
	end

	def write_utf8 name, utf8_string, method = 'w+'
		file = File.open name, method
		file.set_encoding 'utf-8'
		file.write utf8_string
		file.close
	end
end