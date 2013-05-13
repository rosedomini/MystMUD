
class Actor < WorldObject

	attr_reader :room, :level
	attr_reader :hp, :maxhp, :mp, :maxmp
	def str; @str > 100 ? 100 : @str end
	def con; @con > 100 ? 100 : @con end
	def wis; @wis > 100 ? 100 : @wis end
	def dex; @dex > 100 ? 100 : @dex end
	def armor; @armor > 200 ? 200 : @armor end
	attr_reader :str, :con, :wis, :dex, :armor, :ambidexterity
	attr_reader :spell, :inv, :equip, :aff
	attr_reader :master, :last_teller, :following, :team
	attr_reader :skin, :avatar, :master, :last_teller, :status, :target, :weapons, :shields
	attr_writer :target, :last_teller, :master, :team, :following, :room
	
	def after_load
		@left_fist = Fist.new(self, :left)
		@right_fist = Fist.new(self, :right)
		update_weapons_and_shields
	end
	
	def init
		@aff = {}
		@hp_arrows = @mp_arrows = 0
		@status = :none
	end
	
	def in_olc? immortal; @room.in_olc? immortal end
	
	Equip = {
		:cheville_gauche => 'Cheville gauche',
		:cheville_droite => 'Cheville droite',
		:bras_gauche => 'Bras gauche',
		:bras_droit => 'Bras droit',
		:dos => 'Dos',
		:torse => 'Torse',
		:oreille_gauche => 'Oreille gauche',
		:orielle_droite => 'Oreille droite',
		:yeux => 'Yeux',
		:doigt_gauche => 'Doigt gauche',
		:doigt_droit => 'Doigt droit',
		:pieds => 'Pieds',
		:front => 'Front',
		:gants => 'Gants',
		:tête => 'Tête',
		:jambes => 'Jambes',
		:cou => 'Cou',
		:taille => 'Taille',
		:main_gauche => 'Main gauche',
		:main_droite => 'Main droite',
		:poignet_gauche => 'Poignet gauche',
		:poignet_droit => 'Poignet droit'
	}
	
	Shortcut = [
		['Item 6', 'Sac 1', 'Armure 1', 'Masque 1', 'Lettre 3', 'Weapon 4', 'Joyaux 11', 'Skill 7', 'Lettre 2', 'Skill 6'],
		['affections', 'inventory', 'equipement', 'who', 'spells', 'skills',        'team',         'score', 'option',   'help']
	]
	
	def add_item_stats item
		stats = item.stats
		@str += stats[:for] if stats[:for]
		@con += stats[:con] if stats[:con]
		@wis += stats[:sag] if stats[:sag]
		@dex += stats[:dex] if stats[:dex]
		@armor += stats[:armure] if stats[:armure]
		if stats[:vie]
			@maxhp += stats[:vie]
			@hp += stats[:vie]
		end
		if stats[:magie]
			@maxhp += stats[:magie]
			@hp += stats[:magie]
		end
	end
	
	def remove_item_stats item
		stats = item.stats
		@str -= stats[:for] if stats[:for]
		@con -= stats[:con] if stats[:con]
		@wis -= stats[:sag] if stats[:sag]
		@dex -= stats[:dex] if stats[:dex]
		@armor -= stats[:armure] if stats[:armure]
		if stats[:vie]
			@maxhp -= stats[:vie]
			@hp -= stats[:vie]
		end
		if stats[:magie]
			@maxhp -= stats[:magie]
			@hp -= stats[:magie]
		end
	end
	
	# Symbol affection, int power, time (s)
	def affect aff, power, time
		unaffect aff if stat = @aff[aff]
		@aff[aff] = [time, power]
		if respond_to? x = "affect_#{aff}" then __send__ x, time, power
	end end
	
	def unaffect aff
		if stat = @aff[aff]
			if respond_to? x = "unaffect_#{aff}" then __send__ x, *stat end
			@aff.delete aff
			true
		else false
	end end
	
	def can_hold? item; true end
	def can_reach? actor; actor.room == @room and sees actor end
	def capname; @name[0].upcase << @name[1..-1] end

	def cmd arg
		$p = self
			
		if arg =~ /^(!)?(\w+) *(.*\S+)? *$/
			$link = $1
			$cmd = $2
			$x = $3
		else return end
		
		if $cmd =~ /^[nsoebh]$/
			@room.exits.each_key do |exit_name|
				if $cmd == exit_name.to_s[0]
					move exit_name
					return
			end end
			wiz 'Vous ne pouvez pas aller par là.'
			return
		end
		
		unless $x or $link
			@room.exits.each_key do |exit_name|
				if $cmd == exit_name.to_s[0, $cmd.length]
					move exit_name
					return
		end end end
		
		cmd = nil
		
		if $link
			if cmd = $command[$cmd] and cmd.link then nil
			else
				Log.link_error
				wiz 'Lien brisé : l\'erreur vient d\'être enregistrée.', :red
				return
			end
		elsif Command::Keyboard =~ /;(#{$cmd}\w*);/
			cmd = $command[$1]
		elsif immortal? and Command::Admin_keyboard =~ /;(#{$cmd}\w*);/
			cmd = $command[$1]
		else
			wiz "Commande inconnue : #{$cmd}", :red
			return
		end
		
		if @status == :dead and !cmd.ko
			wiz "Vous n'êtes pas en état de faire celà... vous êtes mort#{e} !"
		elsif mob? and !cmd.mob
			say_to_master "Je ne peux pas faire ça, maître#{'sse' if @master and @master.female?}."
		elsif @authlevel < cmd.authlevel
			wiz 'Vos pouvoirs ne vous permettent pas de faire cela.'
		else return send "check_#{cmd}#{$link}".to_sym end
		nil
	end
	
	def e; 'e' if @desc and @desc[:sex] == 2 end
	
	def each_second
		@aff.each{|aff, stat| unaffect aff if (stat[0] -= 1) < 1}
		unless (useful = hp_arrows_useful).zero?
			if @maxhp < 500 then heal useful, true else heal 5 end
		end
		unless (useful = mp_arrows_useful).zero?
			if @maxmp < 500 then energize useful, true else energize 5 end
	end end
	
	def energize points, percent = nil
		points = (@maxmp / 100.0 * points).round if percent
		@mp += points
		if @mp < 0 then @mp = 0
		elsif @mp > @maxmp then @mp = @maxmp
	end end
	
	def emote sth
		each_close_heroe{|x| x.wiz "#{sb? x} #{sth}"}
	end
	
	def female?; @desc[:sex] == 2 end
	
	def heal points, percent = nil
		points *= @maxhp / 100.0 if percent
		@hp += points
		if @hp < 1
			@hp = 1
			killed
		elsif @hp > @maxhp then @hp = @maxhp
	end end
	
	def hp_arrows_useful
		useful = @target ? @hp_arrows : @hp_arrows + 4
		if useful > 10 then 10
		elsif useful < -10 then -10
		else useful
	end end
	
	def hurt dmg, actor
		@hp -= dmg
		if @hp < 1 then @hp = 1; killed actor
		elsif @hp > @maxhp then @hp = @maxhp end
	end
	
	def hwiz sth, color = nil
		wiz CGI.escapeHTML(sth.to_s), color
	end
	
	def immortal?; @authlevel > 0 end
	
	def implantation; '% est là' end
	
	def left_handed?; @ambidexterity <= 50 end
	
	def right_handed?; @ambidexterity > 50 end
	
	def mp_arrows_useful
		if @mp_arrows > 10 then 10
		elsif @mp_arrows < -10 then -10
		else @mp_arrows end
	end
	
	def mp= new_mp
		@mp = (new_mp > @maxmp) ? @maxmp : new_mp
	end
	
	def get_peace
		@target = nil
		$actor.each_value{|x| x.target = nil if x.target == self}
	end
	
	def retrieve id, number = 1
		if @inv[id] and @inv[id] >= number
			@inv[id] -= number
			ret = @inv[id]
			@inv.delete id if @inv[id].zero?
			ret
	end end
	
	def say_to_master sth, color = nil
		@master.wiz "#{name} vous dit : #{sth}", color
	end
	
	def sb? actor, maj=true
		if actor.sees self
			if maj then capname else @name end
		else
			if maj then 'Quelqu\'un' else 'quelqu\'un' end
	end end
	
	def sees a; !a.aff[:invisibilité] or @aff[:'vision de l\'invisible'] end
	
	def up_spell id, points = 1
		if spell = @spell[id] then spell += points
		else @spell[id] = points end
	end
	
	def update_weapons_and_shields
		left = (left = @equip[:main_gauche]) ? left : @left_fist
		right = (right = @equip[:main_droite]) ? right : @right_fist
		@weapons = {}
		@weapons[:left] = left if left.type == :arme
		@weapons[:right] = right if right.type == :arme and left.stats[:deux_mains].nil?
		@shields = []
		@shields << shield if shield = @equip[:main_gauche] and shield.type == :bouclier
		@shields << shield if shield = @equip[:main_droite] and shield.type == :bouclier
	end
	
	def xp_gives actor # à prendre en compte plus tard
		((115 - rand(31))*(@level**2)*(@level+50)*(1+0/3) / 1000).to_i # replace 0 with @ren
	end
end