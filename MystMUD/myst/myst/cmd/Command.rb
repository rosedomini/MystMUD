
# Définition de la classe command

class Command < WorldObject
	attr_reader :french_name, :type, :mob, :ko,
		:authlevel, :keyboard, :link, :syntax, :help
	
	Types = [:action, :a_divers, :a_gestion, :a_olc,
		:communication, :divers, :gestion]
	
	Client = {
		:alert=>            5,
		:box_append=>       10,
		:box_append2=>      15,
		:box_clear=>        20,
		:div_append=>       23,
		:div_setHtml=>      25,
		:enemy_clear=>      30,
		:enemy_show=>       35,
		:enemy_update=>     40,
		:list_append=>      45,
		:list_display=>     47,
		:list_remove=>      50,
		:list_show=>        55,
		:team_append=>      60,
		:team_clear=>       65,
		:team_hide=>        70,
		:team_remove=>      73,
		:team_show=>        75,
		:team_update=>      80,
		:top_append=>       85,
		:top_clear=>        90,
		:top_show=>         95,
		:set_values=>       115,
		:shortcuts_show=>   120,
		:stats_clear=>      125,
		:stats_update=>     130,
		:window_create=>    135,
		:window_edit=>      140,
		:window_hide=>      145,
  :window_resize=>    150,
		:window_set_title=> 155,
		:window_show=>      160,
	}
	
	Client.each_key{|x| Client[x] = [Client[x]].pack('C').force_encoding UTF8}
	
	Admin_keyboard = ''
	Keyboard = ''
	
	def admin; authlevel > 0 end
end