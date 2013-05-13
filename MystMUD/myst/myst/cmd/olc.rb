
# fonctions des commandes admin concernant la création et l'édition

class Actor
	def cmd_set object, variable, value
		wiz "Nouvelle valeur : #{value = object.from_olc variable, value}"
		object.instance_variable_set variable, value
	end

	def cmd_summonItem item, number = 1
		@inv.add item, number
		wiz "Vous invoquez #{gift = item.x number}."
		each_close_heroe{|x| "#{sb? x} invoque #{gift}."}
	end
	
	def cmd_edit klass, object
		s = "<input type=button onclick=p('olc') value=OLC>\
<input type=button onclick=\"p('redit show')\" value=REdit>\
#{"<input type=button onclick=\"p('olc #{klass}')\" \
value=\"#{klass}\">" if klass}<br>\
<table style=width:100%;border:none class=default><tr>\
<td align=center width=100></td>\
<td width=100% align=center><b><font color=cyan>\
#{klass} (<font color=orange>#{id = object.id}</font>)</font><br></td>\
<td width=30 align=center></td><td align=center width=100></td>"

		OLC[klass].each do |variable|
			type, value = object.to_olc "@#{variable}".to_sym
			rows = 1
			value_rows = value.split("\n")
			value_rows.each{|row| rows += row.length / 60}
			
			s << "</tr><tr><td align=right>#{variable}</td>\
<td>#{Dat.var_editor klass, id, type, variable, value, rows}</td>\
<td align=center>#{type}</td>"

		end
		echo :top_show, "#{s}</tr></table>"
	end
	
	def cmd_clone klass, id
		if Clonable.index klass.to_sym
			new_id = (hash = Map[klass]).new_id
			hash << hash[id].duplicate(new_id)
			wiz "Objet #{klass}[#{id}] cloné en [#{new_id}] - \
<a href=\"javascript:p('edit #{klass} #{new_id}')\">Modifier</a>"
		else
			wiz 'Ce type d\'objet ne peut pas encore être cloné.'
	end end

	def cmd_olcShow klass, object
		s = "<p align=center><b><font color=cyan>#{klass} (<font color=orange>\
#{id = object.id}</font>)</font></b></p>\
<input type=button onclick=\"p('edit #{klass} #{id}')\" value=Modifier> \
#{"<input type=button onclick=\"p('clone #{klass} #{id}')\" \
value=Cloner>" if Clonable.index(klass)}\
#{"<br> &nbsp;<input class=input size=4 type=text value=1 id=summon>\
 &nbsp;<input type=button onclick=\"p('summonItem #{id} ')\" \
value=Invoquer>" if klass == Item}<br><hr>"

		OLC[klass].each do |variable|
			if (value = object.instance_variable_get("@#{variable}").inspect).length > 50
				rows = value.length / 30 + 1
				s << "<br><b><font color=cyan>#{variable}: </font></b><br>\
<textarea style=width:100% rows=\"#{rows > 10 ? 10 : rows}\" cols=33>#{value}</textarea><br>"
			else
				s << "<br><b><font color=cyan>#{variable}: </font></b>#{value}<br>"
		end end
		echo :div_setHtml, 'olc_preview', s
	end

	def cmd_olc klass = nil, needle = nil # shows olc or class pannel
		s = "<input type=button onclick=p('olc') value=OLC>\
<input type=button onclick=\"p('redit show')\" value=REdit>"

		OLC.each_key{|klass| s << "<input type=button \
onclick=\"p('olc #{klass}')\" value=\"#{klass}\">"}
		
		if klass		
			if needle
				if needle == '*'
					variables = Map[klass]
					display = "Affichage de tou#{'te' if Dat::ClassVoc[klass][2]}s les %"
				else
					variables = Map[klass].select{|id, x| x.name.contains needle}
					display = "Affichage des % dont le nom contient \
\"<font color=orange>#{needle}</font>\""
				end
			else
				variables = Map[klass].select{|id, x| x.in_olc? self}
				display = "Affichage des % apparent#{'e' if Dat::ClassVoc[klass][2]}s \
dans un rayon de 6 salles. <a href=\"javascript:p('olc #{klass} *')\">Afficher tout</a>"
			end
			
			echo :top_show, "#{s}<br><br><p>&nbsp; #{display.sub! '%', "<b>\
<font color=cyan>#{Dat::ClassVoc[klass][1]}</font></b>"}</p><div style=\"\
width:366px;position:fixed;top:0px;right:0px;bottom:300px;overflow:auto\">\
<table id=olc_preview_table class=default><tr>\
<td><div id=olc_preview></div></tr></table></div><div id=\"list_#{klass}\"></div>"
			
			echo :list_show, klass = klass.to_s, 'olc_edit'
			
			variables.each_value do |variable|
				echo :list_append, klass, [id = variable.id].pack('N'), "<span \
onmouseover=\"p('olcShow #{klass} #{id}')\">#{variable} \
(<font color=orange>#{id}</font>)</span>"

			end
			
			echo :list_display, klass
		else echo :top_show, s end
	end
	
	def cmd_varEdit variable, arg
		case variable
		when 'Mob:skin'
			s = '<div style=width:100%>'
			
			$skin.each_value do |skin|
				s << "<img title=\"#{skin.name}\" style=float:left onclick=\
\"p('varEdit Mob:skin2 #{arg} #{skin.id}')\" src=\"ico/chars/#{skin.source}.png\">"
			end
			
			echo :div_setHtml, 'select_skin', s << '</div>'
		when 'Mob:skin2'
			if arg =~/(\d+) (\d+)/
				v = $skin[$2.to_i].source
				cmd "set Mob #{$1} skin #{v}"
				echo :div_setHtml, 'select_skin', "<p align=center><img title=\"#{v}\" \
src=\"ico/chars/#{v}.png\" onclick=\"p('varEdit Mob:skin #{$1}')\"></p>"
			else wiz 'Erreur: utilisation de la commande varEdit avec de mauvais paramètres.' end
		when 'Mob:avatar'
			s = '<div style=width:100%>'
			
			$avatar.each_value do |avatar|
				s << "<img title=\"#{avatar.source}\" style=float:left onclick=\
\"p('varEdit Mob:avatar2 #{arg} #{avatar.id}')\" src=\"ico/avatar/#{avatar.source}.png\">"
			end
			
			echo :div_setHtml, 'select_avatar', s << '</div>'
		when 'Mob:avatar2'
			if arg =~/(\d+) (\d+)/
				v = $avatar[$2.to_i].source
				cmd "set Mob #{$1} avatar #{v}"
				echo :div_setHtml, 'select_avatar', "<p align=center><img title=\"#{v}\" \
src=\"ico/avatar/#{v}.png\" onclick=\"p('varEdit Mob:avatar #{$1}')\"></p>"
			else wiz 'Erreur: utilisation de la commande varEdit avec de mauvais paramètres.' end
		end
	end
end
