
class Actor
	# affiche le calendrier et la date virtuelle
	def check_time
		s = "<table width=400 bgcolor=white border=1\
 style=color:black;border-collapse:collapse;margin-left:50px><tr>\
 <td colspan=2 align=center>\
 <font color=blue>Année #{(d = wdate)['year']}</font></td>\
 <td>#{6}</td><td>#{World::Month[6]}</td></tr>"
 
		5.times do |n|
			s << "<tr><td>#{n+=1}</td><td>#{World::Month[n]}</td>\
<td>#{n+=6}</td><td>#{World::Month[n]}</td></tr>"
		end
		
		wiz "#{s}</table><br>Nous sommes le jour #{d['day']} \
du mois d#{d['month'].apos} de l'année #{d['year']}.<br>\
Il est #{d['hours']}h#{'0' if d['minutes'] < 10}#{d['minutes']}."
	end
	
	def cmd_help cmd = nil, word = nil # commande
		if cmd.is_a? Command or cmd.is_a? Symbol and cmd = $command[cmd.to_s]
			wiz "<hr><font color=orange>Utilisation : </font>\
#{cmd.syntax}<br> ¤ #{cmd.help}"

		elsif cmd == 'move'
   wiz "<hr><font color=orange>Se déplacer : </font>les commandes n, s, o, e, h\
 et b vous mènent vers les directions nord, sud, ouest, est, haut ou bas. Il ex\
iste d'autres types de sorties accessibles en tapant leur nom.<br>Par exemple :\
 <b>gr</b> pour franchir une <b>grille</b>."

		elsif cmd == 'shortcuts'
				wiz "<hr><font color=orange>Utilisation des raccourcis : </font>si votre cu\
rseur est sur la barre de commandes et que celle-ci est vide, appuyez sur un de\
s chiffres au-dessus des lettres azertyuiop. La commande <a href=javascript:p('\
option')>option</a> vous permet de configurer 10 raccourcis."
				
		elsif cmd == 'keywords'
			wiz "Les prépositions <b>on</b>, <b>from</b>,  et <b>to</b> \
peuvent être remplacées par une virgule.<br>Exemple: <b><i>drag me to hell</i></b> OU <b><i>drag me, hell</i></b>"

		elsif cmd == 'syntax'
			syntax = Syntax_words.each{|x, syntax| break syntax if word == x}
			wiz "<font color=orange>#{word.capitalize} :</font> \
#{syntax.is_a?(String) ? syntax : 'Il n\'y a pas d\'aide pour ce paramètre.'}"

		else
			s = "<div id=help class=window>\
<a href=\"javascript:p('help move')\">Déplacement du personnage</a> &nbsp;\
<a href=\"javascript:p('help shortcuts')\">Utilisation des raccourcis</a><br>\
<br><u>Liste des commandes :</u><br><br>"

			[:action, :communication, :gestion, :divers].each do |type|
				s << type.to_s.capitalize << '<p>'
				$command.each_value do |cmd|
					if cmd.keyboard and cmd.type == type and cmd.authlevel <= authlevel
						s << "<a href=\"javascript:p('help #{cmd}')\" \
 title=\"#{cmd.french_name}\">#{cmd}</a> &nbsp;"
				end end
				s << '</p>'
			end
			
			if immortal?
				s << "<br><u>Commandes Divines :</u><br><br>"
				
				[:a_divers, :a_gestion, :a_olc].each do |type|
					s << case type
						when :a_divers then 'Divers'
						when :a_gestion then 'Gestion'
						when :a_olc then 'Online Creator'
					end << '<p>'
					$command.each_value do |cmd|
						if cmd.keyboard and cmd.type == type and cmd.authlevel <= authlevel
							s << "<a href=\"javascript:p('help #{cmd}')\" title=\"#{cmd.french_name}\">#{cmd}</a> &nbsp;"
					end end
					s << '</p>'
				end
			end
   echo :window_create, 'help', 'Aide', 'help', "#{s}</div>",
    [1, 601, 0].pack('Css')
   echo :window_resize, 'help', '450', 'auto'
	end end

	def cmd_option option = nil
		if option == 'cancel'
			if task = Task::List.find{|x| x.klass == self and x.func == :delete_character}
				Task::List.delete_one task
				wiz 'Suppression de votre personnage annulée.'
			else
				wiz 'Il n\'y a rien à annuler.'
			end
			
		elsif option == 'password'
			echo :top_clear
			wiz 'Entrez votre mot de passe actuel :'
			@sock.control = :require_current_password_to_change_it
			
		elsif option == 'delete character'
			echo :top_clear
			if task = Task::List.find{|x| x.klass == self and x.func == :delete_character}
				wiz "Votre personnage sera supprimé définitivement d'ici #{task.timeleft} secondes. <br>\
Tapez <i><b>option cancel</b></i> pour annuler."
			else
				wiz 'Entrez votre mot de passe pour supprimer définitivement votre personnage :'
				@sock.control = :require_password_to_delete_character
			end
			
		elsif option == 'account'
			echo :top_show, "<p><u>Gestion du compte :</u></p>\
<p><a href=\"javascript:p('option password')\">Changer votre mot de passe</a></p>\
<p><a href=\"javascript:p('option delete character')\">Détruire votre personnage</a></p>"

		elsif option == 'skin'
			s = '<br><u>Skins disponibles :</u><br><br><table class=compact><tr>'
			i = 1
			
			$skin.each_value do |skin|
				break if skin.id > 999999
				s << "<td><img onclick=\"p('!selectSkin #{skin.id}')\" \
src=\"ico/chars/#{skin.source}.png\"></td>"
				s << '</tr><tr>' if (i%20).zero?
				i += 1
			end
			
			s << '</tr></table><br><br><u>Avatars disponibles :</u><br><table class=compact><tr>'
			i = 1
			
			$avatar.each_value do |avatar|
				break if avatar.id > 999999
				s << "<td><img width=102 onclick=\"p('!selectAvatar #{avatar.id}')\" \
src=\"ico/avatar/#{avatar.source}.png\"></td>"

				s << '</tr><tr>' if (i%6).zero?
				i += 1
			end
			
			echo :top_show, s << '</tr></table>'
			
		elsif option == 'shortcut'
			echo :top_show, "<p><u>Configuration des raccourcis :</u></p>\
<div id=list_shortcuts></div>"

			echo :list_show, 'shortcuts', 'edit;moveup;movedown'
			
			commands = @shortcut[1]
			@shortcut[0].each_with_index do |icon, i|
			
				echo :list_append, 'shortcuts', [i+1].pack('N'), "<table class=compact><tr>\
<td><img class=list-ico src=\"ico/shortcuts/#{icon}.png\"></td>\
<td style=padding-left:7px;width:100% align=left>\
<b>#{i+1}</b> : #{commands[i]}</td></tr></table>"

			end
			
			echo :list_display, 'shortcuts'
			
		else
			echo :top_show, "<br>\
<p><u>Options disponibles :</u></p>\
<p><a href=\"javascript:p('option shortcut')\">Configurer les raccourcis</a></p>\
<p><a href=\"javascript:p('option skin')\">Changer d\'apparence</a></p>\
<p><a href=\"javascript:p('option account')\">Gestion du compte</a></p>\
<p><a href=javascript:p('pray')>Signaler ou proposer quelque chose</a></p>"
		end
	end
	
	def cmd_shortcut action, id, value
		case action
		when 'cmd'
			value.gsub! '&lt;br&gt;', "\n"
			@shortcut[1][id] = value
			wiz "Commande modifiée pour le raccourcis N°#{id+1}"
			show_shortcuts
		when 'ico'
			if $icon.index value
				@shortcut[0][id] = value
				wiz "Icône modifiée pour le raccourcis N°#{id+1}"
				show_shortcuts
			else Error.cmd_hack 'shortcut' end
		when 'edit'
			echo :top_show, "<br><table style=width:80% align=center><tr><td>\
Raccourcis N°<b><font color=orange>#{id+1}</font></b></td><td align=right>\
<input type=button onclick=\"p('option shortcut')\" value=\"Autres raccourcis\"></td></tr></table>\
<p>Changer l'icône :</p><table><tr><td>#{$str['shortcut icons'].gsub '%{id}', id.to_s}</td></tr></table><hr>\
<p>Commande(s) associée(s) (une par ligne) :</p><br>\
<textarea rows=5 id=shcmd style=width:90%>#{@shortcut[1][id].gsub ';', "\n"}</textarea>\
<input type=button value=OK onclick=\"p('!shortcut cmd #{id} '+el('shcmd').value.replace(/\\\\n/g, ';'))\">"

		when 'moveup'
			if id == 0
				wiz 'Ce raccourcis est déjà en tête de liste!'
			else
				2.times do |i|
					array = @shortcut[i]
					x, array[id - 1] = array[id - 1], array[id]
					array[id] = x
				end
				cmd_option 'shortcut'
				show_shortcuts
			end
		when 'movedown'
			if id == 9
				wiz 'Ce raccourcis est déjà en fin de liste!'
			else
				2.times do |i|
					array = @shortcut[i]
					x, array[id + 1] = array[id + 1], array[id]
					array[id] = x
				end
				cmd_option 'shortcut'
				show_shortcuts
			end
		else Error.cmd_hack 'shortcut' end
	end
	
	def cmd_spell spell
		s = "<font color=orange>~ #{spell} ~</font>"
		if power = @spell[spell]
			s <<" maitrisé à #{power}%"
		else
			s << '<br>Vous ne maitrisez pas ce sort.'
		end
		wiz s << "<br>#{spell.desc}<br>École: #{spell.school}
<br>Coût d'énergie à puissance minimale: #{spell.min_cost}
<br>Coût maximal: #{spell.max_cost}"
	end

	def cmd_who all = nil
		if all
			s = '<font color=orange>~ Liste des joueurs ~</font>'
			$heroe.each_value do |heroe|
				s << "<br> - #{heroe}#{' (en ligne)' if heroe.online?}"
			end
		else
			s = "<table width=400 cellpadding=2 cellspacing=0><tr>\
<td style=\"border-right:1px solid white\"><font color=orange \
align=left>Joueurs connectés</font></td>\
<td style=\"border-right:1px solid white\">niveau</td><td>informations</td></tr>"

			$actor.each_value do |actor|
				if actor.heroe?
					s << "<tr><td style=\"border-right:1px solid white\">#{actor}</td>\
<td style=\"border-right:1px solid white\">#{actor.level}</td><td></td></tr>"
			end end
			s << '</table>'
		end
		wiz s
	end
end