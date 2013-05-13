
class Spell < WorldObject
	attr_reader :desc, :school, :min_cost, :max_cost, :func, :arg_target
	
	def inspect; "$spell[#{@id}]" end
	
	Schools = ['Magie Blanche', 'Protection', 'Violence']
	
	def container; $spell end
end
