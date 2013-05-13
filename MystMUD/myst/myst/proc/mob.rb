
class << Mob.named('Kariati')
	def hurt dmg, actor
		@hp -= dmg
		if @hp < 1
			@hp = @maxhp
			@mp = @maxmp
			cmd 'cast soin'
			get_peace
			if actor.heroe?
				say 'Très bien, je vois que vous progressez.'
				actor.add_xp xp_gives(actor) if actor and actor.heroe?
			end
		elsif @hp > @maxhp then @hp = @maxhp
	end end
	
	def on_see actor 
		if actor.heroe? and @room.id == 2
			if actor.equip[:main_gauche] or actor.equip[:main_droite] and actor.equip[:torse]
				say 'Tu es prêt? Parfait! Tape <i><b>kill kari</i></b> pour engager notre duel.'
			else
				say "Bon#{wdate('hours') > 17 ? 'soi' : 'jou'}r #{actor.name}. Je pourrais t'enseigner les bases du combat, mais pour cela il te faut une arme et surtout, une armure! Part donc voir le forgeron, en suivant le chemin vers la forge."
	end end end
end

class << Mob.named('Adel')
	def give_special actor, item
		if actor.room == @room and @room.id == 6
			if actor.can_hold? item
				actor.wiz "#{@name} vous donne #{item}."
				actor.inv << item
			else
				say 'Cet objet semble trop lourd pour toi, je te laisse au sol.'
				@room.actors.wiz "#{@name} pose #{item}."
				room.inv << item
			end
			actor.wiz "Tapez <i><b>wear #{item.name.split(' ')[1]}</b></i> pour l'équiper."
		end
		@busy_building_weapons = nil
	end
	
	def on_wear_view actor, item, on
		if item.id == 1 or item.id == 7 and @room.id == 6
			emote 'semble satisfait du résultat.'
	end end
	
	def on_hear actor, sth
		return if @room.id != 6
		sth.downcase!
		if 'oui'[0, sth.length] == sth
			if @busy_building_weapons then say 'Je suis occupé pour l\'instant.'
			else
				@busy_building_weapons = true
				say "Très bien. Je reviens dans une minute avec ce qu\'il te faut. \
Ne bouge pas hm... #{actor.name}."

				cmd 'wear marteau'
				Task.add(@room, :wiz, 0, -2, 'Des bruits assourdissants résonnent dans la forge.')
				Task.add(self, :cmd, 0, -3, 'remove marteau')
				Task.add(self, :give_special, 0, -4, actor, $item[7])
				Task.add(self, :give_special, 0, -4, actor, $item[1])
			end
		elsif 'non'[0, sth.length] == sth
			say 'Et bien si tu changes d\'avis, fait le moi donc savoir !'
	end end
	
	def on_see actor
		if actor.heroe? and @room.id == 6
			if (i = actor.equip[:main_gauche] and i.type == :arme) \
			or (i = actor.equip[:main_droite] and i.type == :arme)
				say 'Tu es armé ! Va donc voir le maître d\'armes.'
			else
				say "Salut #{actor.name}. Tu viens chercher ton équipement ?"
				actor.wiz "<i><b>say oui/non</b></i> pour lui répondre."

	end end end
end

class << Mob.named('votre mère')
	def on_see actor
		if actor.heroe? and father = $actor[Mob.named('votre père').id]
			if @room.id == 9 and actor.inv[lettre = $item[8]].nil?
				father.say "Tu as du courrier, #{actor} !"
				@inv << lettre
				give actor, lettre, 1
				actor.wiz "<br>Tapez <i><b>inventory</b></i> ou encore \
	<i><b>inv</b></i> pour voir la liste des objets que vous portez avec vous.<br>\
	Tapez <i><b>read let</b></i> pour lire la lettre de Sifnos.<br>"
			end
			if @room.id == 13
				follow
				father.say 'Bon voyage ! Je te souhaite une grande réussite à Sifnos !'
				say 'Et n\'oublie pas de nous écrire !'
				move :nord
				((@room >> self).room = $room[9]) << self
				((father.room >> father).room = $room[9]) << father
			else
				follow actor
				father.follow self
	end end end
	
	def on_tick
		new_room = $room[9]
		unless @following
			if @room != new_room
				((@room >> self).room = new_room) << self
			end
			if father = $actor[Mob.named('votre père').id] and father.room != new_room
				((father.room >> father).room = new_room) << father
	end end end
end
