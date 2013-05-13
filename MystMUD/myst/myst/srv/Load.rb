
# Chargement du monde depuis la base de données

class Load; end
class << Load
	def world
		time = Time.now.to_f
		
		print "\n\t__Chargement du monde__\n"
		
		classes = [Area, Avatar, Body, Command, Heroe,
			Item, Mob, Room, Shop, Skin, Spell, System, World]
		
		print 'Prechargement, '
		
		classes.each{|x| $data[x].pre_load}
				
		$w = $world[1]
		
		(1..3).each do |priority|
			puts "\nLoading level #{priority}... "
			classes.each{|x| $data[x].load priority}
		end
		
		# races
		books
		icons
		system
		set_cmd_globals
		tasks
		
		print "\n\t__Modifications apres-chargement__\n "
		
		classes.each{|x| $data[x].after_load}
		
		require 'proc/mob'
		require 'proc/room'
		print 'Action: repop, '
		$mob.each_value &:repop
			
		puts "\n* Termine en #{ ( (Time.now.to_f - time) * 1000 ).to_i }ms\n\n"
	end
	
 def books
 books = Dir.open "#{ROOT}/save/books"
  books.each do |book|
   if book =~ /^(\d+)\.txt$/
    ($book[$1.to_i] = File.read_utf8 "#{ROOT}/save/books/#{book}").
     gsub! "\n", '<br>'
   end
  end
 end
	
	def icons
		print 'Icon, '
  $icon = File.read_utf8("#{ROOT}/save/data/Icon.rb").split "\n"
		s = ''
		$icon.each do |ico|
			s << "<a href=\"javascript:p('!shortcut ico %{id} #{ico}')\">\
<img style=float:left title=\"#{ico}\" src=\"ico/shortcuts/#{ico}.png\"></a>"
		end
		$str['shortcut icons'] = s
	end
	
	def set_cmd_globals
		keyboard_cmd = []
		admin_keyboard_cmd = []
		$command.each do |name, command|
			if command.keyboard
				(command.admin ? admin_keyboard_cmd : keyboard_cmd) << name
			end
		end
		admin_keyboard_cmd.sort!
		keyboard_cmd.sort!
		Command::Admin_keyboard.replace ";#{admin_keyboard_cmd.join ';'};"
		Command::Keyboard.replace ";#{keyboard_cmd.join ';'};"
		admin_keyboard_cmd.clear
		keyboard_cmd.clear
	end
	
	def system
		print 'System, '
		$hack = $system['hack'].value
		$pray_history = $system['pray'].value
		$system['time_difference'].value = Time.now.to_i - $system['world_time'].value
	end
	
	# def races
		# print '\tLoading Races\n'
		# require 'world/races'
	# end
	
	def tasks
		print 'Préparation des actions futures...'
		Task.add Save, :world
		Task.add Fight, :round, 1.5
		Task.add Task, :each_second, 1
		Task.add Task, :update_cache_server, 17
		Task.add Task, :update_cache_world, 1200
		Task.add Task, :gc, 3
		Task.add $w, :refresh, 0, -60
		Task.add Item, :repop, 600
	end
end
