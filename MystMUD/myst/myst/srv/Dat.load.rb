
def Dat.load type, value, olc = nil
	case type
	when 'Area'
		$area[value]
	when 'Actor'
		$heroe[value] or $mob[value]
	when 'Room'
		$room[value]
	when 'bool', 'Fixnum', 'String', 'Symbol', 'value'
		value
	when 'area_list'
		if value.is_a? Array
			value.each_with_index do |id, i|
				unless value[i] = $area[id]
					raise "There is no Area at index #{id}" end
			end
			value
		else raise 'The area_list to load should look like an Array.' end
	when 'Array'
		if value.is_a? Array then value else raise 'This is not an Array!' end
	when 'Equipement'
		if value.is_a? Hash
			equip = {}
			value.each do |wear, item_id|
				if item = $item[item_id] then equip[wear] = item
				else equip.delete wear
			end end
			equip
		else raise 'The Equipement to load should look like a hash.' end
	when 'exit_list'
		if value.is_a? Hash
			value.each do |name, room_id|
				if room = $room[room_id] then value[name] = room
				else value.delete name end
			end
			value
		else raise 'The exit_list to load should look like a hash.' end
	when 'Hash'
		if value.is_a? Hash then value else raise 'This is not a Hash!' end
	when 'Inventory'
		if value.is_a? Hash
			inv = Inventory.new
			Inventory.new(value).each do |id, number|
				if item = $item[id] and number > 0 then inv[item] = number
				else inv.delete id
			end end
			inv
		else raise 'The Inventory to load should look like a hash.' end
	when 'shortcut'
		s = value
		if s.is_a? Array and s[0].is_a? Array and s[1].is_a? Array and
			s.size==2 and s[0].size==10 and s[1].size==10
		then s else Actor::Shortcut end
	when 'spell_list'
		if value.is_a? Hash
			list = {}
			value.each do |id, pow|
				if spell = $spell[id] then list[spell] = pow
				else list.delete id
			end end
			list
		else  raise 'The spell_list to load should look like a hash.' end
	when 'command_help'
		value.gsub!(/\n/, '<br>')
		value
	when 'command_syntax'
		(value = CGI.escapeHTML value).gsub!(/(( from )|( to )|( on ))/) do
			" <a class=syntax href=\"javascript:p('help keywords')\">#{$1.strip!}</a> "
		end
		value.gsub!(/&lt;([\w-]+)&gt;/,
			'<a class=syntax href="javascript:p(\'help syntax \\1\')">\\1</a>')
		value
	else raise "Can't load type: #{type}"
end end
