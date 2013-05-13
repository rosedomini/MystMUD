
class Heroe < Actor	
	def rcreate direction
		x, y, z = @room.x, @room.y, @room.z
		
		direction = case direction
			when :n then y += 1; :nord
			when :s then y -= 1; :sud
			when :o then x -= 1; :ouest
			when :e then x += 1; :est
			when :h then z += 1; :haut
			when :b then z -= 1; :bas
		end
		
		if $w[x, y, z] then wiz 'Il existe déjà une salle à cet endroit.'
		else $w.create_room x, y, z end
		move direction
	end
	
	def redit show = nil
		if (show.nil? and @redit) or show == false
			@redit = false
			echo :top_clear
			return
		end
		
		s = "<p>\
<input type=button onclick=\"top_clear();p('redit close')\" value=X>\
<input type=button onclick=p('olc') value=OLC>\
 Créer une salle : \
<input type=button onclick=\"p('rcreate n')\" value=n>\
<input type=button onclick=\"p('rcreate s')\" value=s>\
<input type=button onclick=\"p('rcreate o')\" value=o>\
<input type=button onclick=\"p('rcreate e')\" value=e>\
<input type=button onclick=\"p('rcreate h')\" value=h>\
<input type=button onclick=\"p('rcreate b')\" value=b>\
<input type=button onclick=p('goto') value=Goto>\
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
<input type=button onclick=\"p('\
delete room #{@room.id}')\" value=DÉTRUIRE></p>
<table style=width:100%;border:none class=default><tr>\
<td align=center width=100></td>\
<td width=100% align=center><b><font color=cyan>\
Room (<font color=orange>#{@room.id}</font>)</font><br></td>\
<td width=30 align=center></td><td align=center width=100></td>"

		[:@name, :@desc, :@exits, :@items, :@x, :@y, :@z].each do |variable|
			type, value = @room.to_olc variable
			rows = 1
			value_rows = value.split("\n")
			value_rows.each{|row| rows += row.length / 68}
			rows = 5 if variable == :desc
			s << "</tr><tr>\
<td align=right>#{variable}</td>\
<td><form><textarea rows=\"#{rows}\" id=\"olcv_#{variable}\" \
cols=68>#{value}</textarea></td>\
<td><input type=button value=OK onclick=\"p('set Room #{@room.id} #{variable} '\
+replacen(el('olcv_#{variable}').value))\"></td>\
<td align=center>#{type}</td>"
		end
		
		echo :top_show, "#{s}</tr></table>"
		@redit = true
	end
	
	def goto room = nil
		if room and room.is_a? Room
			@room >> self
			(@room = room) << self
			look_around
			redit true if @redit
		else
			s = '<p>Aller à :</p><br>'
			
			room.each_value do |room|
				s << "<p>#{room.id} - <a href=\"javascript:p('goto #{room.id}')\">#{room}</a></p>"
			end
			
			echo :top_show, s
		end
	end

	def ruby script = nil
		if script
			begin
				begin
					eval script
					wiz 'Terminé'
				rescue SyntaxError
					Error.report 'light wiz', 'log'
				end
			rescue
				Error.report 'light wiz', 'log'
			end
		else
			echo :top_show, "<u>Script multi lignes</u><br><br>\
<textarea id=ruby style=width:80%;height:200px></textarea><br>\
<a href=\"javascript:p('ruby '+nreplace(el('ruby').value))\">Exécuter</a>"
		end
	end
end