	
class Mob < Actor	
	attr_reader :lastRepop

	def init
		super
		@lastRepop = @authlevel = 0
	end
	
	def in_olc? immortal
		@room.in_olc? immortal or ($actor[@id] and $actor[@id].room.in_olc? immortal)
	end
	
	def inspect
		if $mob[@id] == self then "$mob[#{@id}]" else "$mob[#{@id}].clone"
	end end
	
	def echo *args; end
	def heroe?; end
	
	def killed actor = nil		
		fatality = case rand 3
			when 0 then 'tombe raide mort'
			when 1 then 'expire son dernier souffle'
			else				 's\'écroule dans une mare de sang'
		end
		
		close_heroes.wiz "#{@name} #{fatality}."
		
		actor.add_xp xp_gives(actor) if actor and actor.heroe?
		
		@equip.each_key do |on| remove on end
		
		$body << body = Body.new.create(self, 720, @room)
		body_inv = body.inv = @inv
		
		get_peace
		
		cmd_team :leave if @team
		
		@room >> self
		$actor.delete @id
	end
	
	def mob?; true end
	def online?; self != $mob[@id] end
	
	def repop force = nil
		minutes = wtime()
		if (force or minutes - @lastRepop > 120) and $actor[@id].nil?
			@lastRepop = minutes
			$actor[@id] = actor = $mob[@id].duplicate(@id, true)
			actor.room << actor
			actor.room.heroes.wiz "#{actor} surgit de nulle part."
		end
	end
	
	def wiz sth, color=nil; end
		# if @master
			# @master.wiz "&gt; #{sth.gsub "<br>", "<br>&gt; "}"
		# end
	# end
end

class << Mob
	def named name
		$mob.value_named name
	end
	
	def repop force = nil
		$mob.each_value do |mob|
			mob.repop force unless $actor[mob.id]
		end
	end
end