
# Vérification des arguments pour chaque commande

class Actor
	#check_affections@gestion
	
	# check_aide @ check_help
	
	def check_cast
		if $x
			if $x.contains ' on '
				regexp = /^(\d+ *)?([\w ]*\S)((( +on +)|(, *))(\D+)( *\d+)?)$/
			else
				regexp = /^(\d+ *)?([\w ]*\S)((()(, *))(\D+)( *\d+)?)?$/
			end
			if $x =~ regexp
				if $1; power = 1 if (power = $1.to_i).zero?
				else power = 10000 end
				if target = $3 and not target = visible_actors.named($7, $8)
					wiz 'Je ne vois pas cette cible.'; return end
				if spell = @spell.key_named($2)
					cast spell, $value < power ? $value : power, target
				else wiz 'Je ne connais pas ce sort.' end
			else cmd_help :cast end
		else cmd_help :cast end
	end
	
	def check_chat
		if $x then chat $x else cmd_help :chat
	end end
	
	def check_drag
		if $x =~ /^(\D+)( *\d+)?(( +to +)|(, *))([\w-]+)$/ # drag body [number] to direction
			if body = visible_bodies.named($1, $2)
				@room.exits.each_key do |exit_name|
					if $6 == exit_name.to_s[0, $6.length]
						drag body, exit_name
						return
				end end
				wiz 'Vous ne pouvez pas aller par là.'	
			else wiz 'Je ne vois pas ce corps.' end
		else cmd_help :drag
	end end

	def check_drop
		if $x == '*' then @inv.each{|item, number| drop item, number}
		elsif (match = $x =~ /^(\*|\d+) *([\w ]+)$/) or $x
			if item = @inv.key_named(match ? $2 : $x)
				drop item, match ? ($1 == '*' ? $value : $1.to_i) : 1
			else wiz 'Je ne trouve pas cet objet.' end
		else cmd_help :drop
	end end
	
	def check_eat
		if $x
			if item = @inv.key_named($x)
				if item.type == :nourriture and (item.stats[:rassasiment] or item.power[:eat])
					eat item
				else wiz 'Un ogre affamé n\'oserait pas !' end
			else wiz 'Je ne trouve pas cet objet.' end
		else cmd_help :eat
	end end

	# check_equipement@gestion

	def check_examine
		if $x =~ /^(\D+)( *\d+)?$/
			name = $1; number = $2
			if item = visible_bodies.named(name, number) \
					or item = @room.inv.key_named(name, number) \
					or item = @inv.key_named(name, number) \
					or item = @equip.value_named(name, number)
				examine item
			else wiz 'Vous ne trouvez pas de tel objet ou corps.' end
		else cmd_help :examine
	end end
	
	def check_follow
		if $x == 'stop' then follow
		elsif $x =~ /^(\D+)( *\d+)?$/
			if actor = visible_actors.named($1, $2) then follow actor
			else wiz 'Cette personne n\'est pas là.' end
		else cmd_help :follow end
	end
	
	def check_get
		if $x == '*' # get *
			unless @room.inv.find{|x, y| !x.fixed} then wiz 'Il n\'y a rien à prendre ici.'
			else @room.inv.each{|item, number| get item, number unless item.fixed} end
			
		elsif $x =~ /^\*(( +from +)|(, *))(\D+)( *\d+)?$/ # get * from <body>
			if body = visible_bodies.named($4, $5)
				if body.inv.empty? then wiz 'Vous n\'y trouvez rien à prendre.'
				else body.inv.each{|item, number| get_from body, item, number} end
			else wiz 'Ce corps n\'est pas là.' end
			
		# get (<number>) <item> from <body>
		elsif $x =~ /^(\*|\d+)? *([\w ]+)(( +from +)|(, *))(\D+)( *\d+)?$/ 
			if body = visible_bodies.named($6, $7)
				if item = body.inv.key_named($2)
					to_pick = $1 ? ($1 == '*' ? $value : $1.to_i) : 1
					get_from body, item, to_pick
				else wiz 'Je ne trouve pas cet objet.' end
			else wiz 'Ce corps n\'est pas là.' end
			
		elsif $x =~ /^(\*|\d+)? *([\w ]+)$/ # get (<number>) <item>
			if item = @room.inv.key_named($2)
				number = $1 ? ($1 == '*' ? $value : $1.to_i) : 1
				if item.fixed then wiz 'Vous ne pouvez pas ramasser ça.'
				else get item, number end
			else wiz 'Je ne trouve pas cet objet.' end
		else cmd_help :get
	end end

	def check_give
		if $x =~ /^(\*|\d+)? *([\w ]+)(( +to +)|(, *))(\D+)( *\d+)?$/
			if actor = visible_actors.named($6, $7)
				if item = @inv.key_named($2)
					number = $1 ? ($1 == '*' ? $value : $1.to_i) : 1
					give actor, item, number
				else wiz 'Je ne trouve pas cet objet.' end
			else wiz 'Je ne vois pas cette personne.' end
		else cmd_help :give
	end end
	
	def check_help
		if $x.nil? then cmd_help
		elsif $x =~ /syntax ([\w-]+)/ then cmd_help 'syntax', $1
		elsif cmd = $command[$x] and cmd.keyboard and cmd.authlevel <= @authlevel
			cmd_help cmd
		elsif $x == 'move' or $x == 'shortcuts' or $x == 'keywords' then cmd_help $x
		else wiz 'Cette commande n\'existe pas.' end
	end
	
	alias check_aide check_help

	# check_inventory@gestion
	
	def check_junk
		if (match = $x =~ /^(\*|\d+) *([\w ]+)$/) or $x
			if item = @inv.key_named(match ? $2 : $x)
				junk item, match ? ($1 == '*' ? $value : $1.to_i) : 1
			else wiz 'Je ne trouve pas cet objet.' end
		else cmd_help :junk
	end end

	def check_kill
		if $x =~ /^(\D+)( *\d+)?$/
			if actor = visible_actors.named($1, $2) then kill actor
			else wiz 'Je ne vois pas cette personne.' end
		else cmd_help :kill
	end end

	def check_look
		if $x.nil? then look_around
		elsif $x =~ /^(\D+)( *\d+)?$/
			if actor = visible_actors.named($1, $2) then look_actor actor
			elsif @name.contains $x then look_actor self
			else wiz 'Cette personne n\'est pas là.' end
		else cmd_help :look
	end end

	def check_option; cmd_option $x end

	def check_pray
		if $x then pray $x else
			wiz 'Vous n\'avez pas entré de message. Vous pouvez l\'écrire là-haut.'
			echo :top_show, "<u>Faire une demande ou signaler un problème quelconque :</u>\
<br><br><textarea id=pray style=width:300px;height:100px></textarea><br>\
<a href=\"javascript:p('pray '+replacen(el('pray').value)\">Envoyer</a>"
			cmd_help :pray
	end end

	def check_quit; logout true end
	
	def check_read
		if $x =~ /^(\D+)( *\d+)?$/
			name = $1; number = $2
			if item = @room.inv.key_named(name, number) \
					or item = @inv.key_named(name, number) \
					or item = @equip.value_named(name, number)
				if item.type == :livre
					read item
				else examine item end
			else wiz 'Vous trouvez pas cet objet.' end
		else cmd_help :read
	end end
	
	def check_remove
		if $x =~ /^(\D+)( *\d+)?$/
			if item = @equip.values.named($1, $2) then remove @equip.key item
			else wiz 'Vous ne portez pas cet objet.' end
		else cmd_help :remove
	end end
	
	def check_reply
		if $x
			if @last_teller
				if @last_teller.online? then reply $x
				else
					wiz "#{@last_teller} n'est plus là.", :red
					@last_teller = nil
			end else wiz 'Répondre... mais à qui ? Utilisez <a href="javascript:p(\'help tell\')">tell</a>.'
		end else cmd_help :reply
	end end

	def check_say
		if $x then say $x else cmd_help :say
	end end
	
	# check_score@gestion
	
	def check_spell
		if $x
			if spell = $spell.value_named($x) then cmd_spell spell
			else wiz 'Ce sort n\'existe pas.' end
		else cmd_help :spell
	end end
	
	# check spells@gestion
	
	def check_selectAvatar!
		if avatar = $avatar[$x.to_i]
			@avatar = avatar.source
			echo :top_clear
			wiz '<b>Avatar mis à jour.</b>'
		else wiz 'Avatar non disponible.'
	end end

	def check_selectSkin!
		if skin = $skin[$x.to_i]
			@skin = skin.source
			echo :top_clear
			wiz '<b>Skin mis à jour.</b>'
		else wiz 'Skin non disponible.'
	end end
	
	def check_special!
		# unused
	end
	
	def check_shortcut!
		if $x =~ /^(\w+) (\d) ?(.+)?$/ and (no = $2.to_i) >= 0 and no < 10
			cmd_shortcut $1, no, $3
		else Error.cmd_hack 'shortcut'
	end end

	def check_shout
		if $x then shout $x else cmd_help :shout
	end end
	
	def check_team
		if $x.nil? then cmd_team
		elsif $x =~ /^sp(\w{,3}) (.+)$/
			if :speak.starts_with? $1
				$x.replace $2
				check_ts
			else cmd_help :team end
		elsif $x =~ /(\w+) (\D+)( *\d+)?/
			if :accept.starts_with? action = $1
				followers = $actor.select{|id, x| x.following == self}
				if actor = followers.value_named($2, $3) then cmd_team :accept, actor
				else wiz 'Cette personne ne vous suit pas.' end
			elsif :switch.starts_with? action
				if @team
					if actor = @team.no(self).named($2, $3) then cmd_team :switch, actor
					else wiz 'Cette personne n\'est pas dans votre équipe.' end
				else wiz 'Vous ne faites pas actuellement partie d\'une équipe.' end
			elsif :join.starts_with? action
				if actor = $actor.no(self).value_named($2, $3) then cmd_team :join, actor
				else wiz 'Cette personne n\'existe pas.' end
			else cmd_help :team; return end
		elsif $x and :leave.starts_with? $x
			if @team then cmd_team :leave
			else wiz 'Vous n\'êtes pas dans une équipe.' end
		else cmd_help :team
	end end

	def check_tell
		if $x =~ /^(\w+) (.+)$/
			sth = $2
			if actor = $actor.select{|k, x| x.heroe?}.value_named($1)
				tell actor, sth
			else wiz 'Cette personne n\'existe pas.' end
		else cmd_help :tell
	end end

	#check_time@divers
	
	def check_ts
		if $x and @team then @team.wiz "#{@name} dit à l'équipe: #{$x}", :yellow
		else cmd_help :ts
	end end
	
	def check_wear
		if $x =~ /^(\D+)( *\d+)?$/
			if item = @inv.keys.named($1, $2) then wear item
			else wiz 'Vous ne possédez pas ou plus cet objet.' end
		else cmd_help :wear
	end end

	def check_who; cmd_who($x ? $x.index('*') : nil) end
end
