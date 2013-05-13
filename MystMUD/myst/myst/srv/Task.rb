
class Task
	attr_reader :id, :timestamp, :klass, :func, :args, :repeat
	attr_writer :repeat
	
	List = []

	def initialize klass, func, repeat = 0, timestamp = 0, *args
		@klass = klass
		@func = func
		@repeat = repeat
		@timestamp = timestamp < 0 ? Time.now.to_f - timestamp : timestamp
		@args = args
	end
	
	def execute
		$task = self
		@klass.__send__ @func, *@args
		@timestamp = Time.now.to_f + @repeat unless @repeat.zero?
	end
	
	def inspect
		"Task.new(#{([@klass, @func, @repeat, @timestamp]+@args).collect(&:inspect)*', '})"
	end
	
	def timeleft; (@timestamp - Time.now.to_f).to_i end
	
	@@each_second_calls = 3
	Each_second_timestart = Time_start 
	
	def self.add *args; List << Task.new(*args) end
	
	def self.each_second
		$task.repeat = Each_second_timestart + (@@each_second_calls+=1) - Time.now.to_f
		$actor.each_value &:each_second
	end

	def self.execute time
		List.each_with_index do |x, i|
			if x.timestamp < time
				x.execute 
				List[i] = nil if x.repeat.zero?
		end end
		List.delete $task = nil
		send_all
	end
end

class << Task
	def gc; GC.enable; GC.start; GC.disable end
	
	def update_cache_server
		set_cache 'server', "#{Time.now.to_f},#{online_players}"
	end
	
	def update_cache_world
		set_cache 'world', [$room, $area, $item, $mob, $heroe, 
			$shop, $spell, $skin, $avatar].collect!(&:size).join(',')
	end
end
