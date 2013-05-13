
class World < WorldObject
	attr_reader :areas, :rooms
	
	def after_load
		@rooms = {}
	
		$room.each_value do |room|
			if rx = @rooms[room.x]
				if ry = rx[room.y] then ry[room.z] = room
				else
					rx[room.y] = {room.z=>room} end
			else
				@rooms[room.x] = {room.y=>{room.z=>room}} end
		end
	end
	
	def in_olc? immortal; true end
	
	Month = {
		1 => 'Oxtanpus',
		2 => 'Arcanbis',
		3 => 'Myha',
		4 => 'Fyul',
		5 => 'Brhon',
		6 => 'Mist',
		7 => 'Adrea',
		8 => 'Neptus',
		9 => 'Sircanceas',
		10 => 'Learius',
		11 => 'Tarnas'
	}
	
	def [] x, y, z; @rooms[x][y][z] end
	
	def create_room x, y, z
		room = Dat.createRoom x, y, z	
		exits = room.exits
		
		if r = @rooms[x+1][y][z] then (exits[:est] = r).exits[:ouest] = room end
		if r = @rooms[x-1][y][z] then (exits[:ouest] = r).exits[:est] = room end
		if r = @rooms[x][y+1][z] then (exits[:nord] = r).exits[:sud] = room end
		if r = @rooms[x][y-1][z] then (exits[:sud] = r).exits[:nord] = room end
		if r = @rooms[x][y][z+1] then (exits[:haut] = r).exits[:bas] = room end
		if r = @rooms[x][y][z-1] then (exits[:bas] = r).exits[:haut] = room end
		
		if rx = @rooms[x]
			if ry = rx[y] then ry[z] = room else rx[y] = {z=>room} end
		else @rooms[x] = {y=>{z=>room}} end
		
		room
	end
	
	def delete_room_index x, y, z
		(ry = (rx = @rooms[x])[y]).delete z
		rx.delete y if ry.empty?
		@rooms.delete x if rx.empty?
	end
	
	def refresh
		puts 'Refreshing...'
		$refresh += 1
		$task.repeat = 55 + rand(10)
		worldTime = wtime()
		
		$actor.each_value do |actor|
			if actor.mob?
				actor.on_tick if actor.respond_to? :on_tick
				actor.heal 20, true
				actor.energize 20, true
		end end
		
		if ($refresh%5).zero?
			$actor.each_value{|x| x.hunger -= 60 if x.heroe?}
		end
		
		$body.each_value{|x| x.over if worldTime > x.expire}
		
		Mob.repop
	end
end
