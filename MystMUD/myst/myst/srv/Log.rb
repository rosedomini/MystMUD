
class Log; end
class << Log
	def link_error
		file = open 'link_errors'
		file.puts "#{Log.time} #{$p} tried to execute `!#{$cmd} #{$x}`"
		file.close
	end
	
	def cmd_error error, arg, heroe = nil
		file = open 'cmd_errors'
		file.puts "#{Log.time} #{heroe or 'A guest'} sent `#{arg}` resulting in:\n#{error}\n*******"
		file.close
	end
	
	def open name
		File.open "#{ROOT}/logs/#{name}.log", 'a'
	end
	
	def time; "#{now = Time.now} =>" end
end
