
class Team < Array
	attr_accessor :leader
	
	def initialize leader
		super 0
		self << @leader = leader
	end
end
