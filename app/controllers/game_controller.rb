class GameController < ApplicationController
	def index
		@host = '176.31.184.68'
		@port = 6021
		@server_online = 'true'
		@server_info = ''
		@online_players = 0
		@myst = ''
=begin
		#server = get_cache('server').split ','
		#world = get_cache('world').split ','
		#server_online = server[TIME].to_i > Time.now.tv_sec - 20

		@host = SERVER_SETTINGS['hostname']
		@port = SERVER_SETTINGS['port']
		@server_online = server_online ? 'true' : 'false'
		@server_info = server_online ? '' :
			'<table class="default" style="width:70%"><tr>
				<td><p>Serveur de jeu <b>fermé</b></p></td>
				<td></td><td><a href="">Actualiser</a><br></td>
			</tr></table>',
		@online_players = server[ONLINE_PLAYERS],
		@myst = "L'univers de Myst contient :
			<ul>
			 <li>#{world[ROOMS]} Salles</li>
			 <li>#{world[AREAS]} Zones</li>
			 <li>#{world[ITEMS]} Objets</li>
			 <li>#{world[MOBS]} Créatures</li>
			 <li>#{world[HEROES]} Héros</li>
			 <li>#{world[SHOPS]} Magasins</li>
			 <li>#{world[SPELLS]} Sorts</li>
			 <li>#{world[SKINS]} Skins</li>
			 <li>#{world[AVATARS]} Avatars</li>
			</ul>"
=end
	end
end