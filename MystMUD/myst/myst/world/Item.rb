
class Item < WorldObject
	attr_reader :desc, :type
	attr_reader :weight, :fixed, :implantation, :wearon, :value
	attr_reader :stats, :power, :required
	
	Types = [:arme, :armure, :money, :nourriture]
	
	def in_olc? immortal
		immortal.inv[self] or immortal.equip.key self \
		or $room.find{|id, x| x.in_olc? immortal and (x.items[self] or x.inv[self])} \
		or $body.find{|id, x| x.in_olc? immortal and x.inv[self]} \
		or $mob.find{|id, x| x.in_olc? immortal and x.inv[self] or x.equip.key self} \
		or $actor.find{|id, x| x.in_olc? immortal and x.inv[self] or x.equip.key self}
	end
	
	def inspect; "$item[#{@id}]" end
	
	def call_power caller
		if caller = @power[caller] and rand(1000) < caller[2]
			$power[caller[0]][caller[1]]
		end
	end
	
	def x number
		if number == 1 then @name
		else "#{@name} (x#{number})" end
	end
end

class << Item
	def repop
		puts 'Item repop...'
		$room.each_value &:item_repop
	end
end