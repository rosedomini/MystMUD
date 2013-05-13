
class Fist
	attr_reader :stats, :actor, :hand
	
	def initialize actor, hand
		@actor = actor
		@hand = hand
		@stats = {:arme => :poing}
		update
	end
	
	def update
		@stats[:puissance] = @actor.str * 3
	end
	
	def type; :arme end
end