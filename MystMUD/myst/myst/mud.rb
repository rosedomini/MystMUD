
=begin

	Script principal

	Arguments :
		check_cmd pour vérifier la liste des commandes
		
=end

UTF8 = ''.force_encoding('UTF-8').encoding

GC.disable # Le nettoyage sera réactivé ponctuellement

trap 'SIGINT', ->{shutdown} # Ctrl+C appelle la méthode Kernel#shutdown

$actor     = {}
$affection = {}
$avatar    = {}
$body      = {}
$book      = {}
$command   = {}
$data      = {}
$guest     = []
$heroe     = {}
$icon      = []
$item      = {}
$mob       = {}
$power     = {}
$race      = {}
$room      = {}
$shop      = {}
$skin      = {}
$spell     = {}
$system    = {}
$world     = {}
$area      = {}

$: << Dir.pwd
require 'settings'
require 'cache/cache.rb'

Dir.chdir "#{ROOT}/myst"
$: << Dir.pwd

require 'date' # all ->
require 'cgi'
require 'digest/md5'
require 'fileutils'
require 'net/http'
require 'socket'; include Socket::Constants
require 'uri' # <- in low case

Time_start = Time.now.to_f

[
	'world/WorldObject',
	'cmd/Command', # requires world/WorldObject
	'srv/globals', # requires cmd/Command
	'func/System',

	'world/Area',
	'world/Avatar',
	'world/Body',
	'world/Item',
	'world/Race',
	'world/Room',
	'world/Shop',
	'world/Skin',
	'world/Spell',
	'world/Team',
	'world/World',

	'actor/Actor',
	'actor/Heroe',
	'actor/Mob',
	'actor/Fist',

	'srv/Dat',
	'srv/Dat.clone',
	'srv/Dat.define',
	'srv/Dat.load',
	'srv/Dat.save',
	'srv/Dat.var_editor',
	'srv/Load',
	'srv/Log',
	'srv/Save',
	'srv/Guest',
	'srv/Task',

	'cmd/action',
	'cmd/admin',
	'cmd/communication',
	'cmd/divers',
	'cmd/divers_a',
	'cmd/gestion',
	'cmd/gestion_a',
	'cmd/olc',
	'cmd/check',
	'cmd/check_admin',

	'func/Error',
	'func/Fight',
	'func/Kernel',
	'func/lists',
	'func/ruby_def',
	'func/Power',
	'func/time',

	'proc/affection',
	'proc/power',

	'spells'
].each{|script| require script}

Dat.define
Load.world

require 'func/undef'

if ARGV[0] == 'check_cmd' then check_cmd else undef check_cmd end

$flood_time = 0
$lastsave   = 0
time        = 0
args        = []

$guest << $server = TCPServer.new(
	SERVER_SETTINGS['hostname'],
	SERVER_SETTINGS['port']
)

puts "Server started at \
#{SERVER_SETTINGS['hostname']}:#{SERVER_SETTINGS['port']}"
		
task_time = Time.now.to_f

def mud_cmd sock, arg
	return if sock.closed?
	now = Time.now.to_f
	
	if $flood_time <= now
		$flood_time = now + 1
		$guest.each{|x| x.flood = 0 }
	end
	
	if (sock.flood += 1) > SERVER_SETTINGS['flood limit']
		sock.eject 'Flood interdit'
		return
	end
	
	sock.__send__ sock.control, arg
			
	send_all
	
	puts "Executed #{arg} in #{(1000000*(Time.now.to_f - now)).round}us"
end

loop do
	if task_time + 0.1 < now = Time.now.to_f
		Task.execute(task_time = now)
	end
	
	next unless ready = select($guest, nil, nil, 0.2)
	
	now = Time.now.to_f
	
	for sock in ready[0]
		if sock == $server and $guest.size - 1 < SERVER_SETTINGS['clients limit']
			begin
				sock = $server.accept #_nonblock
				sock.write "#{Server_policy}\0#{Server_MOTD}"
				sock.init_guest
				$guest << sock
				puts 'Client joined'
			rescue
				puts "#{Dir.pwd}/#{__FILE__}:#{__LINE__} #{$!.inspect}"
			end
		elsif sock.off then sock.eject
		elsif (arg = sock.read_nonblock 2048).length == 2048
			sock.eject 'N\'envoyez pas de commandes aussi longues !'
		else
			begin				
				arg.force_encoding UTF8
				while i = arg.index(/[^\\];/)
					args << arg[0..i]
					arg = arg[(i+2)..-1]
				end
				args << arg
				args.map &:strip!
				args.collect!{|x| CGI.escapeHTML x}
			rescue; next end
			
			puts "Set #{args[0]} in #{(1000000*(Time.now.to_f - now)).round}us"
			
			mud_cmd sock, args[0]
			
			args.each_with_index do |arg, i|
				if i != 0
					Task.add Kernel, :mud_cmd, 0, -0.15*i, sock, arg
			end end
			args.clear
		end
	end
end
