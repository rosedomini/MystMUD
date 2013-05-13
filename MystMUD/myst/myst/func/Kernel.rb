
# fonctions globales

def check_cmd
	$command.each do |name, cmd|
		if cmd.link and !Actor.instance_methods.index("check_#{name}!".to_sym)
			puts "Method unavailable: check_#{name}! for command\n\t#{cmd.inspect}\n\n"
		elsif !cmd.link and !Actor.instance_methods.index("check_#{name}".to_sym)
			puts "Method unavailable: check_#{name} for command\n\t#{cmd.inspect}\n\n"
	end end
	Actor.instance_methods.each do |method|
		if method.to_s =~ /^check_(\w+)(!)?$/
			if cmd = $command[$1]
				if $2 and !cmd.link
					puts "$command[#{$1.inspect}] is not a indicated as a link"
				elsif $2.nil? and !cmd.keyboard
					puts "$command[#{$1.inspect}] is not indicated as working with keyboard"
				end
			else puts "undefined $command[#{$1.inspect}]"
	end end end
	exit
end

def echo *args; $p.echo *args end

def online_players; $guest.size-1 end

def send_all
	$guest.each do |sock|
		if h = sock.h then h.send_msg end
	end
end

def shutdown
	$guest.each{|x| begin x.close rescue nil end}
	exit
end

def wiz sth, color = nil; $p.wiz sth, color end