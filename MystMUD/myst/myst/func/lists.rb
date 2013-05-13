
# class ActorHash < Hash
	# def named s
		# s = s.downcase
		# if @names[@names.index(s)+s.length,50] =~ /\w*=(\d+)/
			# return self[$1.to_i]
		# end
		# nil
	# end
	
	# def initialize
		# super
		# @names = ';'
	# end
	
	# def []= key, value
		# @names << "#{value.name.downcase}=#{key};"
		# store key, value
	# end
# end

class Inventory < Hash
	def initialize hash = {}; hash.each{|x, y| store x, y} end
	
	def << items
		if items.is_a? Item
			if n = self[items] then self[items] += 1
			else store items, 1 end
		elsif items.is_a? Hash
			items.each do |key, value|
				if self[key] then self[key] += value
				else store key, value end
			end
		elsif items.is_a? Fixnum
			self[items] = if self[items] then self[items] + 1 else 1 end
		else raise ArgumentError end
		self
	end
	
	def add item, number
		self[item] = if self[item] then self[item] + number else number end
	end
	
	def >> item
		if self[item]
			if self[item] == 1 then delete item else self[item] -= 1 end
		end
		item
	end
	
	def give item, number, inv
		if number >= self[item]
			inv.add item, self[item]
			delete item
		else
			self[item] -= number
			inv.add item, number
	end end
	
	def junk item, number
		if number >= self[item] then delete item
		else self[item] -= number end
	end
end

class Actor
	def each_actor_in_area
		area = @room.area
		$actor.each_value{|x| yield x if x.room.area == area and x != self}
	end
	def actors_in_area
		area = @room.area
		$actor.select{|id, x| x.room.area == area and x != self}
	end
	
	def each_heroe_in_area
		area = @room.area
		$actor.each_value{|x| yield x if x.heroe? and x.room.area == area and x != self}
	end
	def heroes_in_area
		area = @room.area
		$actor.select{|id, x| x.heroe? and x.room.area == area and x != self}
	end
	
	def each_mob_in_area
		area = @room.area
		$actor.each_value{|x| yield x if x.mob? and x.room.area == area and x != self}
	end
	def mobs_in_area
		area = @room.area
		$actor.select{|id, x| x.mob? and x.room.area == area and x != self}
	end
	
	def each_close_actor; @room.actors.each{|x| yield x if x != self} end
	def each_close_heroe; @room.actors.each{|x| yield x if x.heroe? and x != self} end
	def each_close_mob; @room.actors.each{|x| yield x if x.mob? and x != self} end
	def each_visible_actor; @room.actors.each{|x| yield x if sees x and x != self} end
	def each_visible_body; @room.bodies.each{|body| yield body if sees body} end
	def each_visible_heroe; @room.actors.each{|x| yield x if sees x and x.heroe? and x != self} end
	def each_visible_mob; @room.actors.each{|x| yield x if sees x and x.heroe? and x != self} end
	def each_witness; @room.actors.each{|x| yield x if x.sees self and x != self} end
	def each_witness_heroe; @room.actors.each{|x| yield x if x.heroe? and x.sees self and x != self} end
	def each_witness_mob; @room.actors.each{|x| yield x if x.mob? and x.sees self and x != self} end
	
	def close_actors; @room.actors.select{|x| x != self} end
	def close_heroes; @room.actors.select{|x| x.heroe? and x != self} end
	def close_mobs; @room.actors.select{|x| x.mob? and x != self} end
	def visible_actors; @room.actors.select{|x| sees x and x != self} end
	def visible_bodies; @room.bodies end # @room.bodies.select{|x| sees x}
	def visible_heroes; @room.actors.select{|x| x.heroe? and sees x and x != self} end
	def visible_mobs; @room.actors.select{|x| x.mob? and sees x and x != self} end
	def witnesses; @room.actors.select{|x| x.sees self and x != self}	end
	def witness_heroes; @room.actors.select{|x| x.heroe? and x.sees self and x != self} end
	def witness_mobs; @room.actors.select{|x| x.mob? and x.sees self and x != self} end
end
