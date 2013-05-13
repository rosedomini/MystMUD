# Crossdomain Policy File Server

require 'socket'
require './settings.rb'

server = TCPServer.new(SERVER_SETTINGS['hostname'], 843)
server.set_encoding 'ASCII-8BIT'

puts "Crossdomain server started at #{SERVER_SETTINGS['hostname']}:843"

loop do
	begin
		(sock = server.accept).write "<?xml version=\"1.0\"?> 
<!DOCTYPE cross-domain-policy SYSTEM \"http://www.adobe.com/xml/dtds/cross-domain-policy.dtd\"> 
<cross-domain-policy>  
<allow-access-from domain=\"*\" to-ports=\"*\" />
</cross-domain-policy>\0"
		sock.close
	rescue
		p $!
	end
end
