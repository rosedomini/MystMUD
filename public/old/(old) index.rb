
server = get_cache('server').split ','
world = get_cache('world').split ','
active = server[TIME] && server[ONLINE_PLAYERS] \
	&& server[TIME].to_i > Time.now.tv_sec - 20

print load_html 'index.rhtml',
	'host' => SERVER_SETTINGS['hostname'],
	'port' => SERVER_SETTINGS['port'],
	'server_info' =>
		if active
"<table class=default style=width:70%><tr>\
<td><p>Serveur de jeu <b>actif</b><br>\
Joueurs en ligne : <b>#{server[ONLINE_PLAYERS]}</b></p></td>\
<td><p>Connexion en cours...</p>"
		else
"<table class=default style=width:70%><tr>\
<td><p>Serveur de jeu <b>fermé</b></p></td>\
<td></td><td><a href=index.rb>Actualiser</a><br></td>\
</tr></table>"
		end,
	'Myst' => "
	Salles		#{world[ROOMS]}
	Zones		#{world[AREAS]}
	Objets		#{world[ITEMS]}
	Créatures 	#{world[MOBS]}
	Héros		#{world[HEROES]}
	Magasins 	#{world[SHOPS]}
	Sorts		#{world[SPELLS]}
	Skins		#{world[SKINS]}
	Avatars		#{world[AVATARS]}"
