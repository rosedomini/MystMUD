
class Actor
	def cast_boule_de_feu success, power, target
		if success
			if target or (target = @target and can_reach? target)
				dmg = (power+4*@wis) /2
				
				wiz "Vous envoyez une boule de feu sur #{target.sb? self} ~ #{dmg} points."
				target.wiz "#{sb? target} vous envoie une boule de feu ~ #{dmg} points."
				target.kill self unless target.target
				
				@room.actors.each do |actor|
					if actor.room == @room and actor != self and actor != target
						actor.wiz "#{sb? actor} envoie une boule de feu sur #{target.sb? actor} ~ #{dmg} points."
					end
				end
					
				target.hurt dmg, self
			else
				wiz '<i>Vous n\'êtes pas en combat! Précisez la cible enemie.</i>', 'green'
				wiz 'Vous envoyez une boule de feu qui monte très haut dans le ciel.'
				each_close_heroe do |heroe|
					heroe.wiz "#{sb? heroe} envoie une boule de feu qui monte très haut dans le ciel."
			end end
		else
			wiz 'Vous provoquez des étincelles qui ne s\'embrasent pas.'
			each_close_heroe do |heroe|
				heroe.wiz "Des étincelles échappent des mains d#{sb?(heroe).apos}."
	end end end
	
	def cast_bouclier success, power, target = nil
		if success
			if target
				wiz "Vous agitez vos mains et un voile magique entoure #{target}."
				target.wiz "Un voile magique echappé des mains d#{sb?(target, nil).apos} vous entoure."
				each_close_heroe do |heroe|
					if heroe != target
						heroe.wiz "Un voile magique s'échappe des mains \
d#{sb?(heroe, nil).apos} et entoure #{target.sb? heroe, nil}."
					end
				end
				target.affect :bouclier, power, power /2
			else
				wiz 'Vous encerclez votre corps physique d\'un voile magique teinté de bleu.'
				each_close_heroe do |heroe|
					heroe.wiz "#{sb? heroe} s'entoure d'un voile magique teinté de bleu."
				end
				affect :bouclier, power, power /2
			end
		else
			wiz 'Un voile magique sort de vos mains et manque de vous étrangler.'
			each_close_heroe do |heroe|
				heroe.wiz "Un voile magique sort des mains d#{sb?(heroe, nil).apos} et manque de l'étrangler."
	end end end
	
	def cast_invisibilité success, power, target = nil
		if @aff[:invisibilité] and target.nil?
			wiz 'Vous vous concentrez et laissez votre corps renvoyer la lumière.'
			wh = witness_heroes
			unaffect :invisibilité
			
			each_witness_heroe do |heroe|
				if wh.include? heroe
					heroe.wiz "#{@name} se concentre et devient visible aux yeux de tous."
				else
					heroe.wiz "La silhouette d#{@name.apos} se dessine devant vous."
			end end
		elsif success
			if target
				wiz "Vous accordez les rayons lumineux au corps d#{target.name.apos} afin de le rendre invisible."
				target.wiz "#{sb? target} se concentre et rend transparente votre silhouette."
				wh = target.witness_heroes
				target.affect :invisibilité, power, power*10
				
				each_close_heroe do |heroe|
					if heroe != target
						if !heroe.sees target and wh.include? heroe
							heroe.wiz "#{sb? heroe} se concentre et rend #{target} invisible à vos yeux."
						else
							heroe.wiz "#{sb? heroe} se concentre et permet à #{target.sb? heroe, nil} de disparaître."
				end end end
			else
				wiz "Vous accordez votre corps avec la lumière et le rendez invisible."				
				wh = witness_heroes
				affect :invisibilité, power, power*10
				
				each_close_heroe do |heroe|
					if !heroe.sees self and wh.include? heroe
						heroe.wiz "#{@name} laisse la lumière le traverser et devient invisible à vos yeux."
					else
						heroe.wiz "#{sb? heroe} se concentre et disparaît."
				end end
			end
		else
			if target
				wiz "Vous tentez de manipuler la lumière mais ne voyez disparaître #{target} \
que l'espace d'un instant."
				target.wiz "#{sb? target} tente de vous rendre invisible mais votre silhouette \
récupère son opacité."
			else
				wiz 'Vous tentez de manipuler la lumière mais vos mains n\'échappent à vos yeux qu\'un instant.'
				each_close_heroe do |heroe|
					wiz "#{sb? heroe} se concentre et perturbe un court instant l'équilibre lumineux ambiant."
			end end
		end
	end
	
	def cast_soin success, power, target = nil
		if success
			if target
				wiz "Une énergie blanche émane de vos mains et \
	vous soignez #{target}. ~ #{power} points"

				target.wiz "Une énergie blanche émane des mains \
	d#{sb?(target, nil).apos} et vous soigne. ~ #{power} points"

				each_close_heroe do |heroe|
					if heroe != target
						heroe.wiz "Une énergie blanche émane des mains \
	#{@name} et soigne #{target.sb? heroe, nil}. ~ #{power} points"

				end end
				target.heal power
			else
				wiz "Vos plaies s'illuminent d'une lueur blanche et se referment. ~ #{power} points"
				each_close_heroe do |heroe|
					heroe.wiz "Les plaies d#{sb?(heroe, nil).apos} s'illuminent \
	d'une lueur blanche et se referment. ~ #{power} points"
				end
				heal power
			end
		else
			if target
				wiz "Une énergie blanche émane de vos mains \
et crépite dans l'air avant de disparaître."
			else
				wiz 'Vos plaies s\'adoucirent une court instant sans avoir eu le temps de guérir.'
			end
			each_close_heroe do |heroe|
				heroe.wiz "Une énergie blanche émane des mains \
d#{sb?(heroe, nil).apos} et crépite dans l'air avant de disparaître."
	end end end
end
