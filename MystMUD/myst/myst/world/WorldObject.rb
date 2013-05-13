
class WorldObject
	attr_reader :instance, :instances, :id, :name
	alias to_s name
	
	def initialize id = Map[self.class].new_id, instance = 0, instances = [self]
		@id = id
		@instance = instance
		@instances = instances
		init if respond_to? :init
	end
	
	def instantiate new_id = [2000000, Map[self.class].new_id].max, clone_singleton_methods = true
		new = clone_singleton_methods ? clone : self.class.new(new_id)
		new.instance_variable_set :@id, new_id
		new.instance_variable_set :@instance, @instances.size
		@instances << $x = new
		$data[self.class].data.each do |var|
			new_val = Dat.instantiate var[:type], instance_variable_get(var[:sym])
			new.instance_variable_set var[:sym], new_val
		end
		new.after_load if new.respond_to? :after_load
		new
	end

	def duplicate new_id = nil, clone_singleton_methods = nil
		if clone_singleton_methods
			new = clone
			new.instance_variable_set :@id, new_id if new_id
		else new = self.class.new(new_id) end
		$data[self.class].data.each do |var|
			new_val = Dat.clone var[:type], instance_variable_get(var[:sym])
			new.instance_variable_set var[:sym], new_val
		end
		new.after_load if new.respond_to? :after_load
		new
	end
	
	def to_olc variable
		if data = $data[self.class].data.find{|x| x[:sym] == variable}
			value = Dat.save(type = data[:type], instance_variable_get(variable), true)
			return type, type == 'String' ? value.to_s : value.inspect
		else
			"Error: #{__FILE__}:#{__LINE__}"
	end end
	
	def from_olc variable, value
		if data = $data[self.class].data.find{|x| x[:sym] == variable}
			value = eval value unless data[:type] == 'String'
			Dat.load data[:type], value, true
		else
			raise "Object: #{inspect}\n\tVariable: #{variable}\n\tValue: #{value}"
	end end
end
