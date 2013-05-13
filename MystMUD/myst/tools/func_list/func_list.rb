begin
	require 'settings'
	
	$file = ''
	$rb_files = 0
	$methods = 0
	$lines = 0

	class File
		def list_func
			set_encoding 'UTF-8'
			klass = 'Kernel'
			func = ''
			each_line do |line|
				$lines += 1
				if line =~ /class (\w+)/ or line =~ /module (\w+)/
					klass = $1
				end
				if line =~ /def \w+\.([^;]+)/
					$file << "\t#{klass}.#{$1}"
					$methods += 1
				elsif line =~ /def ([^;]+)/
					$file << "\t#{klass}##{$1}"
					$methods += 1
				end
			end
		end
	end

	def add_files directory, list
		Dir.open(directory).each do |filename|
			if filename =~ /^\.+$/
				next
			elsif File.directory? filepath = "#{directory}/#{filename}"
				add_files filepath, list
			else
				list << filepath
			end
		end
	end

	list = []
	add_files "#{ROOT}/myst", list

	list.each do |filename|
		if filename[-3..-1] == '.rb'
			$rb_files += 1
			$file << filename[12..-4] << "\n"
			File.open filename, 'r' do |file|
				file.list_func
			end
		end
	end

	File.open("#{ROOT}/tools/func_list/func.list", 'w+') do |file|
		file.puts "#{$rb_files} fichiers ruby pour #{$methods} méthodes, en #{$lines} lignes\n\n#{$file}"
	end
	File.open("#{ROOT}/tools/func_list/counts.txt", 'a') do |file|
		file.puts "#{Time.now} => #{$rb_files} fichiers ruby pour #{$methods} méthodes, en #{$lines} lignes."
	end
rescue
	puts $!
	sleep 3
end