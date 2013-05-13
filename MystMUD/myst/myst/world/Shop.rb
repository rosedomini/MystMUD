
class Shop < WorldObject
	attr_reader :keeper, :room, :inv
	
	def in_olc? immortal; @room.in_olc? immortal end
end