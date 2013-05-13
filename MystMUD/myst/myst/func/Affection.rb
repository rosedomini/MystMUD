
class Affection
	attr_reader :name
	
	def initialize name, affect, unaffect
		@name = name
		@affect = affect
		@unaffect = unaffect
		$affection[name] = self
	end
end
