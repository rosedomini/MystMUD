
class Area < WorldObject
	attr_reader :rooms
	
	def init; @rooms = [] end
	def in_olc? immortal; true end
	def inspect; "$area[#{@id}]" end
	
	def instantiate new_id = [2000000, Map[self.class].new_id].max, clone_singleton_methods = nil
		instance = super
		(instance.rooms = @rooms.collect &:duplicate).map &:instantiate
		new_room = room.instances[@instances.size - 1]
		actors.each{|x| x.move new_room}
	end
end
