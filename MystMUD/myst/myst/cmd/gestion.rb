
class Actor
	def check_affections
		s = "<p><font color=orange> ~ Enchantements et maléfices qui vous affectent ~</font></p>"
		s << "<table cellpadding=0 cellspacing=0>"
		first = true
		@aff.each do |aff, pow|
			if first
				s << '<tr><td width=7></td><td width=250>'
				first = false
			else s << '<tr><td></td><td>' end
			s << aff.to_s.capitalize << ": #{pretty_time pow[0]}</td><td>#{pow[1]}%</td></tr>"
		end
		wiz s << '</table>'
	end
	
	def check_equipement
		s = "<p><font color=orange> &nbsp; &nbsp; &nbsp; \
~ Objets équipés ~</font></p>"

		@equip.each do |on, item|
			s << " - <font color=#3399CC>#{Actor::Equip[on]}</font>: #{item}<br>"
		end
		echo :top_clear
		wiz s
	end
	
	def follow actor = nil
		unless actor
			@following = nil
			wiz 'Vous ne suivez plus personne.'
		end
		cmd_team :leave if @team and @team.leader != actor
		if @following == actor
			wiz 'Vous suivez déjà cette personne.'
		else
			wiz "Vous ne suivez plus #{@following}." if @following
			wiz "Vous commencez à suivre #{@following = actor}"
			if @following.sees self
				@following.wiz "#{capname} commence à vous suivre."
			end
		end
	end
	
	def check_inventory
		s = "<p><font color=orange> &nbsp; &nbsp; &nbsp; \
~ Contenu de votre inventaire ~</font></p>"

		@inv.each{|item, nb| s << " - #{item.x nb}<br>"}
		echo :top_clear
		wiz s
	end
	
	def check_score
		wiz "<table cellpadding=0 cellspacing=0 style=\
width:80%;padding:7px><tr>\
<td align=center syle=width:70%><font color=orange>~ #{name} ~</font>\
<br><br></td><td></td>\
</tr><tr>\
<td style=width:50%>Niveau: <font color=#3399CC>#{@level}</font> \
+#{(@xp*100.0/needed = xp_needed).to_i}%
<br>Progression: <font color=#3399CC>#{@xp}</font>/#{needed}<br><br></td>\
<td>Vitalité: <font color=#3399CC>#{@maxhp}</font>
<br>Énergie: <font color=#3399CC>#{@maxmp}</font><br><br></td>\
</tr><tr>\
<td valign=top>Force: <font color=#3399CC>#{str}</font>
<br>Constitution: <font color=#3399CC>#{con}</font>
<br>Dextérité: <font color=#3399CC>#{dex}</font>
<br>Sagesse: <font color=#3399CC>#{wis}</font></td>\
<td><img src=\"ico/avatar/#{@avatar}.png\" height=130></td>\
</tr></table>"
	end
	
	def check_spells
		s = "<p><font color=orange> &nbsp; &nbsp; &nbsp; \
~ Liste de vos sorts ~</font></p>"

		schools = {}
		@spell.each do |spell, power|
			if schools[spell.school]
				schools[spell.school][spell] = power
			else
				schools[spell.school] = ({spell=>power})
			end
		end
		schools.each do |school, spells|
			s << "<p><font color=#3399CC><b>#{school}</b></font><br></p>"
			s << "<table cellpadding=0 cellspacing=0>"
			first = true
			spells.each do |spell, power|
				if first
					s << "<tr><td width=38></td>\
<td width=250>#{spell.to_s.capitalize}</td><td>#{power}%</td></tr>"
					first = false
				else
					s << "<tr><td></td><td>#{spell.to_s.capitalize}</td><td>#{power}%</td></tr>"
				end
			end
			s << '</table>'
		end
		wiz s
	end
	
	def remove on # place where item to remove is
		item = @equip[on]
		@equip.delete on
		@inv << item
		remove_item_stats item
		update_weapons_and_shields if on == :main_gauche or on == :main_droite
		wiz "Vous enlevez #{item}."
		each_close_heroe{|x| x.wiz "#{sb? x} enlève #{item}."}
		each_close_mob do |x|
			x.on_remove_view self, item, on if x.respond_to? :on_remove_view
	end end
	
	def cmd_team action = nil, actor = nil
		case action
		when :accept
			if @team and @team.include? actor
				wiz "#{actor} fait déjà partie de votre équipe."
			else
				@team = Team.new(self) unless @team
				if @team.leader == self
					if actor.following == self
						@team.wiz "#{actor} fait maintenant partie de votre équipe."
						@team.echo :team_append, [actor.id].pack('N'), actor.name,
							[(100*actor.hp/actor.maxhp).to_i].pack('C')
						@team.each do |x|
							actor.echo :team_append, [x.id].pack('N'), x.name,
								[(100*x.hp/x.maxhp).to_i].pack('C')
						end
						@team << actor
						actor.team = @team
						actor.wiz "Vous faites maintenant partie de l'équipe de #{@name}."
					else wiz "#{actor} doit vous suivre avant de pouvoir l'accepter dans votre équipe." end
				else wiz "Vous n'êtes pas mene#{female? ? 'use' : 'ur'} de l'équipe." end
			end
		when :join
			if @team then wiz 'Vous faites déjà partie d\'une équipe.'
			else
				follow actor
				actor.wiz "&lt;&lt; #{@name} veut se joindre à votre équipe. &gt;&gt;", :yellow
			end
		when :leave
			if @team
				wiz 'Vous venez de quitter votre équipe.'
				@team.delete_one self
				@team.no(self).echo :team_remove, [@id].pack('N')
				@team.wiz "#{@name} vient de quitter votre équipe."
				if @team.size == 1
					@team[0].team = nil
					@team.clear
				elsif @team.leader == self
					leader = @team.leader = @team[0]
					leader.wiz "Vous êtes maintenant mene#{leader.female? ? 'use' : 'ur'} de l'équipe."
					@team.no(leader).each do |actor|
						actor.wiz "#{leader} est maintenant mene#{leader.female? ? 'use' : 'ur'} de l\'équipe."
						actor.follow leader
					end
				end
				@team = nil
				echo :team_clear
			else wiz 'Vous ne faites actuellement pas partie d\'une équipe.' end
		when :switch
			if @team
				if @team.leader == self
					s = "#{@name} désigne #{actor} mene#{actor.female? ? 'use' : 'ur'} de l'équipe."
					wiz "Vous désignez #{actor} mene#{actor.female? ? 'use' : 'ur'} de l'équipe."
					(@team.leader = actor).wiz "#{@name} vous désigne mene#{actor.female? ? 'use' : 'ur'} de l'équipe."
					@team.each do |x|
						if x != self and x != actor
							x.wiz s
							x.follow actor
					end end
				else wiz "Vous n'êtes pas mene#{female? ? 'use' : 'ur'} de l'équipe." end
			else wiz 'Vous ne faites actuellement pas partie d\'une équipe.' end
		else echo :team_show end
	end

	def wear item
		if wearon = item.wearon.find{|on| @equip[on].nil?}
			if wearon == :main_gauche and @equip[:main_droite].nil? and
					item.wearon.include? :main_droite and
					item.stats.include? :puissance and right_handed?
				wearon = :main_droite
			elsif wearon == :main_droite and @equip[:main_gauche].nil? and
					item.wearon.include? :main_gauche and
					item.stats.include? :puissance and left_handed?
				wearon = :main_gauche
			end
			msg1 = "équipe #{item}."
			msg2 = "Vous équipez #{item}."
		elsif wearon = item.wearon[0]
			last = @equip[wearon]
			@inv << last
			remove_item_stats item
			msg1 = "remplace #{last} par #{item}."
			msg2 = "Vous remplacez #{last} par #{item}."
		else
			wiz 'Cet objet ne peut pas être équipé.'
			return
		end
		
		if wearon == :main_droite and i = @equip[:main_gauche] and i.stats[:deux_mains]
			remove :main_gauche
			wiz 'Vous portiez une arme à deux mains.', :red
		elsif wearon == :main_gauche and i = @equip[:main_droite] and i.stats[:deux_mains]
			remove :main_droite
			wiz 'Vous portiez une arme à deux mains.', :red
		end
		
		@equip[wearon] = @inv >> item
		add_item_stats item
		update_weapons_and_shields if wearon == :main_gauche or wearon == :main_droite
		
		wiz msg2
		each_close_heroe{|x| x.wiz "#{sb? x} #{msg1}"}
		each_close_mob do |x|
			x.on_wear_view self, item, wearon if x.respond_to? :on_wear_view
	end end
end