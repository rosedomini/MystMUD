
class Body < WorldObject
	attr_reader :aid, :actor, :room, :expire, :inv
	attr_writer :inv, :room
	
	def after_load; over unless @actor	end
	def in_olc? immortal; @room.in_olc? immortal end
	def inspect; "$body[#{@id}]" end
	
	def create actor, expire, room
		n = (@actor = actor).name
		@name = "le corps d#{n[0] =~ /[aeiouy]/i ? '\'': 'e '}#{n}"
		@expire = wtime + expire
		@inv = Inventory.new
		(@room = room) << self
		self
	end
	
	def over
		@room.inv << @inv
		@room.heroes.wiz "L#{@name[1..-1]} se décompose."
		@room >> self
		$body.delete @id
	end
end
