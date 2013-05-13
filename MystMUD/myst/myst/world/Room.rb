
class Room < WorldObject
	attr_reader :desc, :x, :y, :z, :area, :background
	attr_reader :actors, :bodies, :exits, :inv, :items
	# @items est la liste des objets qui sont par défaut présents dans cette salle
	
	def after_load
		$body.each_value{|x| @bodies << x if x.room == self}
		@area.rooms << self if @area and !@area.rooms.include? self
	end
	
	def init; @actors = []; @bodies = [] end
	def in_olc? immortal; distance_to(immortal.room) < 6 end
	def inspect; "$room[#{@id}]" end
	
	def destroy
		$room.delete @id
		$w.delete_room_index @x, @y, @z
		$room.each_value do |room|
			if exit = room.exits.key(self)
				room.exits.delete exit
			end
		end
		nearest_room = Room.near self
		@actors.clone.each{|x| x.move nearest_room, nil, nil, true}
		@bodies.clone.each{|x| self >> x; nearest_room << self}
		nearest_room.inv << @inv
		@area.rooms.delete @id
		@destroyed = true
		freeze
	end
	
	Exit = {
		:nord => 's\'en va vers le nord',
		:sud => 's\'en va vers le sud',
		:ouest => 's\'en va vers l\'ouest',
		:est => 's\'en va vers l\'est',
		:haut => 's\'en va vers le haut',
		:bas => 's\'en va vers le bas',
		:nowhere => 's\'en va dans le néant',
		:porte => 'passe la porte et s\'en va',
		:piroge => 'monte dans la pirogue',
		:ponton => 'monte sur le monton',
		:escalier => 's\'en va en prenant l\'escalier',
		:echelle => 'monte à l\'échelle',
		:trappe => 'descend par la trappe',
		:ramer => 'commence à ramer',
		:chemin => 's\'en va par le chemin',
		:plage => 'court vers la plage',
		:grimper => 's\'en va en grimpant'
	}
	
	def distance_to room
		((@x-room.x)**2+(@y-room.y)**2+(@z-room.z)**2)**0.5
	end
	
	# permet de mettre à jour les listes @actors et @bodies
	def << object
		if object.is_a? Actor
			@actors << object
			Task.add(self, :on_enter, 0, -0.3, object) if object.online?
		elsif object.is_a? Body then @bodies.insert 0, object
		else
			$! = 'Room#<< only accepts Actors or Bodies'
			Error.report
		end
		object
	end
	
	# permet de mettre à jour les listes @actors et @bodies
	def >> object
		if object.is_a? Actor then @actors.delete_one object
		elsif object.is_a? Body then @bodies.delete_one object
		else
			$! = 'Room#>> only accepts Actors or Bodies.'
			Error.report end
		object
	end
	
	def heroes; @actors.select &:heroe? end
	
	# réapparition des objects par défaut de la salle s'ils ont disparus
	def item_repop
		@items.each do |item, number|
			if num = @inv[item] then @inv[item] = number if num < number
			else @inv[item] = number
	end end end
	
	def mobs; @actors.select &:mob? end
	
	def on_enter actor
		action_on_enter actor if respond_to? :action_on_enter
		if actor.room == self
			@actors.each do |x|
				if x.respond_to? :on_see and x.sees actor
					x.on_see actor
	end end end end
	
	def wiz msg, color = nil; @actors.wiz msg, color end
end

class << Room
	def near x, y = nil, z = nil
		if x.is_a? Room
			y, z = x.y, x.z
			x = x.x
		end
		min_dist = 10**9
		choise = $room.first[1]
		$room.each_value do |room|
			if min_dist > (dist = ((room.x-x)**2+(room.y-y)**2+\
					(room.z-z)**2)**0.5) && dist != 0
				min_dist = dist
				choise = room
		end end
		choise
	end
end
