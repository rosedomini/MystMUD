
# FILE NOT USED

class Check; end
class << Check
	def world
		Check.all_actors
		$room.each_value &:check
		$area.each_value &:check
	end
	
	def all_actors
		$actor.each_value &:check
		$heroe.each_value &:check
		$mob.each_value &:check
	end
end

class Actor
	def check
		move $room[1], nil, nil, true if @room.destroyed?
		@target = nil if @target.destroyed?
		@master = nil if @master.destroyed?
		@last_teller = nil if @last_teller.destroyed?
		Check.spell_list @spell
		Check.inv @inv
		Check.equip @equip
	end
end

class Area
	def check
		@room.clear
		$room.each_value{|x| @room << x if x.area == self}
	end
end

class Room
	def check
		Check.inv @inv
		Check.inv @items
		@exits.each{|name, room| @exits.delete name if room.destroyed?}
		@actors.each{|x| @actors.delete_one x unless $actor.key x and x.room == self}
		@bodies.each{|x| @bodies.delete_one x unless $body.key x and x.room == self}
	end
end
	
class << Check
	def inventories
		$heroe.each_value{|x| Check.inv x.inv}
		$actor.each_value{|x| Check.inv x.inv}
		$mob.each_value{|x| Check.inv x.inv}
	end
	
	def inv inv
		inv.each{|k, x| inv.delete k if k.destroyed? or x < 1}
	end
	
	def spell_lists
		$heroe.each_value{|x| Check.spell_list x.spell}
		$actor.each_value{|x| Check.spell_list x.spell}
		$mob.each_value{|x| Check.spell_list x.spell}
	end
	
	def spell_list spell
		spell.each{|k, x| spell.delete k if k.destroyed? or x < 1}
	end
	
	def equipements
		$heroe.each_value{|x| Check.equip x.equip}
		$actor.each_value{|x| Check.equip x.equip}
		$mob.each_value{|x| Check.equip x.equip}
	end
	
	def equip equip
		equip.each{|k, x| equip.delete k if x.destroyed?}
	end
end