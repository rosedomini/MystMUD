
class Dat
	attr_reader :name, :hash, :class, :table, :data
	
	def initialize name, hash, klass, table = nil
		@name = name
		@class = klass
		@table = table ? table : name
		@hash = hash
		@data = []
		@queries = []
	end
	
	def add priority, name, type, &check_proc
		@data << ({
			:priority   => priority,
			:name       => name,
			:sym        => "@#{name}".to_sym,
			:type       => type,
			:check_proc => check_proc,
		})
	end
	
	def pre_load
		sort_by_name = [System, Command]
		data = File.read_utf8 "#{ROOT}/save/data/#{@class}.rb"
		eval("[#{data}]").each do |values|
			id = values[sort_by_name.index(@class) ? :@name : :@id]
			object = @hash[id] = @class.new(id)
			values.each{|name, value| object.instance_variable_set name, value}
		end
	end
	
	def load priority
		print "#{@class}, "
		@data.each do |variable|
			if variable[:priority] == priority
				type  = variable[:type]
				check = variable[:check_proc]
				sym   = variable[:sym]
				@hash.each_value do |x|
					value = Dat.load(type, ($x = x).instance_variable_get(sym))
					check[value] if check
					x.instance_variable_set sym, value
				end
			end
		end
	end
	
	def after_load
		print "#{@name}, "
		hash.each_value{|x| x.after_load if x.respond_to? :after_load}
	end
	
	def save
		print "#{@name}, "
		data = ''
	
		@hash.each do |id, object|
			data << "##{@class} #{object.instance_variable_get :@id}\n{\n"
		
			@data.each do |variable|
				value = object.instance_variable_get variable[:sym]
				data << "\t:#{variable[:sym]} \
=> #{Dat.save(variable[:type], value).inspect},\n"
			end
			
			# Ajout d'un champs
			
			# if @class == Item
				# data << "\t:@implantation => \"% est posé là\",\n"
			# end
			
			data.chop
			data << "},\n\n"
		end
		
		return "#{ROOT}/save/data/#{@class}.rb", data
	end
end
