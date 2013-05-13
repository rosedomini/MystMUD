
class Actor
	def destroy
		return false if @destroyed
		$mob.delete @id
		$actor.delete @id
		@room.actors.delete_one self unless @room.destroyed
		@room = @target = @master = @last_teller = nil
		@spell.clear; @inv.clear; @equip.clear; @aff.clear
		@destroyed = true
	end
end

class Room
	def destroy
		$room.delete @id
		@area = nil
		@inv.clear; @items.clear; @exits.clear; @actors.clear; @bodies.clear
		@destroyed = true
	end
end

# class Destroy
# end