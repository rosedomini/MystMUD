
class Power
	attr_reader :name
	
	def initialize name, block
		@name = name
		@proc = block
		$power[name] = self
	end
	
	def [] *args; @proc.call *args end
end
