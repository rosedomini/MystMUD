# Vérification des arguments pour les commandes admin

class Actor
	def check_clone
		if $x =~ /^(\w+) (\d+)$/
			if OLC[klass = $1.to_class] and Map[klass][$2.to_i]
				cmd_clone klass, $2.to_i
			else
				Error.olc_class end
		elsif $x =~ /^(\w+) (\w+)$/
			if OLC[klass = $1.to_class] and Map[klass][$2]
				cmd_clone klass, $2
			else
				Error.olc_class end
		else cmd_help :clone end
	end
	
	def check_delete
		if $x =~ /^(\w+) (\d+)$/
			if $1 == 'room'
				if room = $room[$2.to_i]
					if room.id != 1
						room.destroy
					else wiz 'Vous ne pouvez pas détruire <b>cette</b> salle.' end
				else wiz 'Cette salle n\'existe pas.' end
			# elsif ...
			else cmd_help :delete end
		else cmd_help :delete end
	end
	
	def check_dump
		begin
			if $x then cmd_dump $x else cmd_dump end
		rescue
			wiz "Erreur : #{$!}" end
	end

	def check_edit
		if $x =~ /^(\w+) (\d+)$/
			if OLC[klass = $1.to_class] and Map[klass][$2.to_i]
				cmd_edit klass, Map[klass][$2.to_i]
			else 
				Error.olc_class end
		elsif $x =~ /^(\w+) (\w+)$/
			if OLC[klass = $1.to_class] and object = Map[klass][$2]
				cmd_edit klass, object
			else
				Error.olc_class end
		else
			cmd_help :edit end
	end
	
	#check_force@gestion_a
	
	#check_giveXp@gestion_a

	def check_goto
		if $x
			if room = $room[$x.to_i] then goto room
			elsif $x =~ /^(\D+)( *\d+)?$/
				if $2 and room = $room.value_named($1, $2) then goto room
				elsif rooms = $room.named($1) then goto rooms
				else 'Aucune salle ne correspond.' end
			else cmd_help :goto end
		else goto $room end
	end
	
	def check_load; cmd_load $x end
   
	def check_olc
		if $x.nil? then cmd_olc
		elsif $x =~ /^(\w+)( +((\w+)|\*))?$/
			if klass = OLC.keys.find{|x| x.to_s.downcase.index($1.downcase) == 0}
				cmd_olc klass, $3
			else cmd_olc end
		else cmd_help :olc end
	end

	def check_olcShow
		if $x =~ /^(\w+) (\d+)$/
			if OLC[klass = $1.to_class] and object = Map[klass][$2.to_i]
				cmd_olcShow klass, object
			else Error.olc_class end
		elsif $x =~ /^(\w+) (\w+)$/
			if OLC[klass = $1.to_class] and object = Map[klass][$2]
				cmd_olcShow klass, object
			else Error.olc_class end
		else cmd_help :olcShow end
	end
	
	def check_rcreate
		if $x =~ /^[bonseh]$/ then rcreate $x.to_sym
		else
			wiz 'Les directions possibles sont n-s, o-e ou h-b. Les noms des sorties peuvent être changés après.'
		end
	end

	def check_redit
		if $x == 'show' then redit true
		elsif $x == 'close' then redit false
		else redit end
	end

	def check_ruby
		if $x then ruby CGI.unescapeHTML($x) else ruby end
	end

	def check_set
		if $x =~ /^(\w+) (\w+) (\w+) (.+)$/
			if hash = Map[klass = $1.to_class] \
					and OLC[klass].index($3)
				if object = (hash[$2.to_i] or hash[$2])
					cmd_set object, "@#{$3}".to_sym, CGI.unescapeHTML($4)
				end
			else Error.olc_class end
		else cmd_help :set end
	end

	def check_summonItem
		if $x =~ /^(\d+) (\d+)$/
			item, number = $item[$1.to_i], $2.to_i
		elsif $x =~ /^(\d+)? *(.+)$/
			item, number = $item.value_named($2), $1 ? $1.to_i : 1
		else
			cmd_help :summonItem; return
		end
		if item then cmd_summonItem item, number.zero? ? 1 : number
		else wiz 'Cet objet n\'existe pas.' end
	end
	
	def check_varEdit
		if $x
			if $x =~ /(Mob:skin2?) (.+)/
				cmd_varEdit $1, $2
			elsif $x =~ /(Mob:avatar2?) (.+)/
				cmd_varEdit $1, $2
			else wiz 'Erreur: utilisation de la commande varEdit avec de mauvais paramètres.' end
		else wiz 'Erreur: utilisation de la commande varEdit sans paramètres.' end
	end
end