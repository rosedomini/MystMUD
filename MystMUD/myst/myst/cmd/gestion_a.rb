
# fonctions des commandes admin de gestion

class Actor
	def check_giveXp
		if $x =~ /^(\w+) (\d+)$/
			if (amount = $2.to_i) > 0
				if heroe = $actor.select{|k, x| x.heroe?}.value_named($1)
					heroe.add_xp amount, nil
				else wiz 'Cette personne n\'existe pas.' end
			else wiz 'l\'expérience acquise ne peut pas être retirée !' end
		else cmd_help :giveXp end
	end
	
	def check_force
		if $x =~ /^([\w ]+)(( +to +)|(, *))(.+)$/
			if actor = close_actors.named($1)
				oldmaster = actor.master
				actor.master = self
				p actor
				actor.cmd $5
				actor.master = oldmaster
			else wiz 'Cette personne n\'est pas là' end
		else cmd_help :force end
	end
end