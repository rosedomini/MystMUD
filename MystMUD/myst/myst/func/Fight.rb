class Fight
	Hit1 = [
		'Vous cognez %s',
		'Vous cognez fortement %s !',
		'vous cogne',
		'vous cogne brutalement !',
		'cogne %s',
		'cogne puissamment %s !'
	]
	Hit2 = [
		'Vous frappez %s',
		'Vous frappez adroitement %s !',
		'vous frappe',
		'vous frappe brutalement !',
		'frappe %s',
		'frappe adroitement %s !'
	]

	Hit = Hash.new do |hash, key|
		if rand(2).zero? then Hit1 else Hit2 end
	end
	
	Hit.store :épée, [
		'Vous tranchez %s',
		'Vous tranchez %s d\'un coup critique !',
		'vous tranche',
		'vous tranche d\'un coup adroit !',
		'tranche %s',
		'tranche %s d\'un coup bien placé !'
	]
	Hit.store :lance, [
		'Vous blessez %s',
		'Vous transpercez %s d\'un coup habile !',
		'vous blesse',
		'vous transperce avec dextérité !',
		'blesse %s de sa lance',
		'transperce %s avec dextérité !'
	]
	Hit.store :nécromancie, [
		'Vous ensorcellez %s',
		'Vous maudissez %s d\'une énergie grise démoniaque !',
		'vous ensorcelle',
		'vous maudit par les pouvoirs de la mort !',
		'ensorcelle %s',
		'maudit %s d\'une énergie diabolique !'
	]

	def self.fighters
		fighters = []
		$actor.each_value do |actor|
			if target = actor.target and target.online? and actor.room == target.room
				target.target = actor
				fighters << actor unless fighters.index actor
				fighters << target unless fighters.index target
		end end
		fighters
	end
	
	@@round_calls = 3
	Round_timestart = Time_start

	def self.round
		$task.repeat = Round_timestart + 2*(@@round_calls+=1) - Time.now.to_f
		
		(fighters = Fight.fighters).each do |actor|
			next unless target = actor.target
			
			actor.weapons.each do |hand, weapon|
				next if weapon.is_a? Fist and !actor.weapons[hand == :left ? :right : :left].is_a? Fist
				
				if rand(actor.dex) < rand(target.dex)
					actor.wiz "#{target.sb? actor} esquive votre attaque."
					target.wiz "Vous esquivez l'attaque d#{actor.sb?(target, nil).apos}."
					
					actor.witness_heroes.no(target).each do |x|
						x.wiz "#{target.sb? x} esquive l'attaque d#{actor.sb?(x, nil).apos}."
					end
				else
					weapon.update if weapon.is_a? Fist
					hit_type = Hit[weapon.stats[:arme]]
					hit = weapon.stats[:puissance] * actor.str / target.con.to_f
					hit = hit * 0.7 + rand(hit * 0.6)
					if critical_hit = rand(9).zero? then hit *= 2.5 end
					hit -= target.armor
					hit = hit < 0 ? 0 : hit.round
					
					if critical_hit
						actor.wiz "#{hit_type[1] % target.sb?(actor, nil)} - #{hit} points", :red
						target.wiz "#{actor.sb? target} #{hit_type[3]} - #{hit} points", :red

						actor.each_witness_heroe do |x|
							if x != target
								x.wiz "#{actor.sb? x} #{hit_type[5] % target.sb?(x, nil)} - #{hit} points", :red
						end end
					else
						actor.wiz "#{hit_type[0] % target.sb?(actor, nil)} - \
	<b><font color=cyan>#{hit}</font></b> points"
						target.wiz "#{actor.sb? target} #{hit_type[2]} - \
	<b><font color=cyan>#{hit}</font></b> points"

						actor.each_witness_heroe do |x|
							if x != target
								x.wiz "#{actor.sb? x} #{hit_type[4] % target.sb?(x, nil)} - \
	<b><font color=cyan>#{hit}</font></b> points"
						end end
					end
					
					target.hurt hit, actor # Blesse la cible et si mort : renvoi les xp
				
				end
				
				break unless actor.target == target
			end
		end
	end
end
