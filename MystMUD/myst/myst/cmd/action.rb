
# f(0.X, 0.Y) = 0.X^(1/(1+0.X*2))

class Actor
	def cast spell, power, target
		cost = spell.min_cost +
			(power * (spell.max_cost - spell.min_cost) / 100.0).round
		if cost <= @mp
			@mp -= cost
			success = rand(100) < 100*(@spell[spell]/100.0)**(1/(1+@wis/50.0))
			if spell.arg_target then send spell.func, success, power, target
			else send spell.func, success, power end
		else wiz 'Vous n\'avez pas assez de magie pour cela.'
	end end
	
	def drag body, exit_name
		old_room = @room
		body.room >> body
		(body.room = (new_room = @room.exits[exit_name])) << body
		unless move exit_name,
				"#{@name} #{Room::Exit[exit_name]} en traînant #{body}.",
				"#{@name} arrive en traînant #{body}."
			body.room >> body
			(body.room = old_room) << body
	end end
	
	# void actor_drop(Actor self, Item item, int number){
			# Actor a;
			# int i;
			# char *gift;
		
		# inv_give(self->inv, number, self->room->inv);
		# fprintf(self->msg, "Vous posez %s", gift = item_x(item, number));

		# for(i = 0; i < actors_size; i++){
			# a = actors[i];
			# if(actor_close(a, self){
				# fprintf(a->msg, "%s pose %s", actor_sb(self, a), gift);
			# }
		# }
	# }
	
	# void actor_drop(Actor self, Item item, int number){
			# char *gift;
		
		# inv_give(self->inv, item, number, self->room->inv);
		# WIZ(self, "Vous posez %s", gift = item_x(item, number));

		# EACH_CLOSE_ACTOR(x, (
			# WIZ(x "%s pose %s", actor_sb(self, x), gift);
		# ))
	# }
	
	def drop item, number
		@inv.give item, number, @room.inv
		wiz "Vous posez #{gift = item.x number}."
		each_close_heroe{|x| x.wiz "#{sb? x} pose #{gift}."}
	end
	
	def eat item
		@inv >> item
		each_witness_heroe{|x| x.wiz "#{@name} mange #{item}."}
		wiz "Vous mangez #{item}."
		self.hunger += item.stats[:rassasiment] if heroe? and item.stats[:rassasiment]
		item.call_power :eat
	end

	def examine something
		if something.is_a? Body
			if (items = (body = something).inv).empty?
				s = 'mais n\'y trouvez rien.'
			else
				s = 'et y trouvez :<br>'
				body.inv.each{|item, number| s << "<br> - #{item.x number}"}
			end
			wiz "Vous examinez #{body} #{s}"
			each_close_heroe{|x| x.wiz "#{sb? x} scrute #{body}."}
		else
			item = something
			each_close_heroe{|x| x.wiz "#{sb? x} examine #{item}."}
			weight = (item.weight / 3 + 0.5).round
			s = (weight == 1) ? 'une livre' : "#{weight} livres"
			s = weight.zero? ? 'ne pèse presque rien' : "pèse environ #{s}"
			wiz "Vous examinez #{item}. Ceci #{s}.<br> #{item.desc}"
	end end
	
	def get item, number
		@room.inv.give item, number, @inv
		wiz "Vous ramassez #{gift = item.x number}."
		each_close_heroe{|x| x.wiz "#{sb? x} ramasse #{gift}."}
	end
	
	def get_from body, item, number
		body.inv.give item, number, @inv
		wiz "Vous ramassez #{gift = item.x number} depuis #{body}."
		each_close_heroe{|x| x.wiz "#{sb? x} ramasse #{gift} depuis #{body}."}
	end
	
	def give actor, item, number
		@inv.give item, number, actor.inv
		wiz "Vous donnez #{gift = item.x number} à #{actor}."
		actor.wiz "#{sb? actor} vous donne #{gift}."
		
		each_close_heroe do |x|
			x.wiz "#{sb? x} donne #{gift} à #{actor.sb? x, nil}." if x != actor
	end end
	
	def junk item, number
		@inv.junk item, number
		wiz "Vous détruisez #{gift = item.x number}."
		each_close_heroe{|x| x.wiz "#{sb? x} détruit #{gift}."}
	end

	def kill target
		if @target
			wiz "Vous combattez déjà #{@target}."
		else
			wiz "Vous attaquez #{@target = target}."
			target.wiz "#{sb? target} vous attaque."
			each_close_heroe do |x|
				x.wiz "#{sb? x} attaque #{target.sb? x, nil}." if x != target
	end end end
	
	def look_around
		s = '<font color=#3399CC>' << @room.name << '</font><br>'
		s << @room.desc << '<br><br><font color=green>Sorties :</font> '

		if @room.exits.empty? then s << 'aucunes'
		else @room.exits.each_key do |exit|
				s << " #{exit}&nbsp;"
		end end
		
		s << '<br>' unless (v_a = visible_actors).empty?
		
		v_a.each do |x|
			s << "<br><img src=\"ico/chars/#{x.skin}.png\"> \
#{x.implantation.sub '%', x.following == self ? "#{x.name} (vous suit)" : x.name}"
		end
		
		s << '<br>' unless @room.inv.empty?
		
		i1 = ''; i2 = ''
		@room.inv.each do |item, number|
			(item.fixed ? i1 : i2) << \
				"<br>- #{item.implantation.sub '%', item.x(number)}"
		end
		
		s << i1 << i2
		
		s << '<br>' unless (v_b = visible_bodies).empty?
			
		v_b.each{|x| s << "<br>+ #{x} repose à terre"}
		
		echo :top_clear
		echo :set_values, "bg", @room.background
		wiz s
		# redit true if immortal? and @redit
	end
	
	def look_actor actor
		state = actor.capname << case (@hp/@maxhp*100).to_i
			when 0..5		then ' est très proche de la mort.'
			when 6..20		then ' saigne énormément.'
			when 21..40	then ' est couvert d\'entailles.'
			when 41..60	then ' est légèrement blessé.'
			when 61..90	then ' est affaibli.'
			when 91..99	then ' est en pleine forme.'
			when 100		then ' est en parfaite santé.'
		end
		
		s = ''
		actor.equip.each do |on, item|
			s << " - <font color=#3399CC><b>#{Actor::Equip[on]}</b></font> : #{item}<br>"
		end

		wiz "<table cellpadding=0 cellspacing=0 style=width:80%><tr>\
<td><p>#{state}</p><p>\
<img src=\"ico/chars/#{actor.skin}.png\"> \
<font color=orange>~ Équipement ~</font></p>#{s}</td>\
<td valign=top><br><img src='ico/avatar/#{actor.avatar}.png' height=100></td>\
</tr></table>"
		
		each_witness_heroe do |heroe|
			if heroe == actor then actor.wiz "#{name} vous regarde."
			else heroe.wiz "#{name} regarde #{actor.sb? heroe, nil}."
	end end end
	
	def move exit_name_or_room, exit_msg = nil, enter_msg = nil, force = nil
		followers = []
		
		if exit_name_or_room.is_a? Room
			room = exit_name_or_room
			exit_name = :nowhere
		else
			$actor.each_value{|x| followers << x if x.following == self and x.room == @room}
			room = @room.exits[exit_name_or_room]
			exit_name = exit_name_or_room
		end
		
		movement_allowed = true
		each_close_actor do |actor|
			if actor.target == self
				if rand(2).zero?
					wiz "Vous tentez de fuir mais #{actor} vous retient."
					movement_allowed = false
					break
		end end end
		
		if !movement_allowed and force
			wiz "Une force incontrôlable vous entraîne tout de même vers #{room}."
		end
		
		if movement_allowed or force
			get_peace
			if room == @room
				witness_heroes.wiz "#{capname} tourne en rond."
				wiz 'Vous tournez en rond.'
				return true
			end
			witness_heroes.wiz exit_msg ? exit_msg : "#{capname} #{Room::Exit[exit_name]}."
			@room >> self
			(@room = room) << self
			witness_heroes.wiz enter_msg ? enter_msg : "#{capname} arrive."
			look_around
			unless followers.empty?
				wiz ' '
				followers.each{|x| x.move exit_name_or_room}
			end
			redit true if immortal? and @redit
		end		
		movement_allowed
	end
end