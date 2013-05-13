
def Dat.save type, value, olc = nil
	case type
	when 'Actor'
		value.id
	when 'Area'
		value.id
	when 'Room'
		value.id
	when 'bool'
		value
	when 'Fixnum'
		value.to_i
	when 'String'
		value
	when 'Symbol'
		value
	when 'value'
		value
	when 'area_list'
		value = value.clone
		value.each_with_index{|x, i| value[i] = x.id}
		value
	when 'Array'
		value
	when 'Equipement'
		(equip = value.clone).each do |wear, item|
			equip[wear] = item.id
		end
		equip
	when 'exit_list'
		value = value.clone
		value.each{|exit, room| value[exit] = room.id}
		value
	when 'Hash'
		value
	when 'Inventory'
		inv = {}
		value.each do |item, number|
			inv[item.id] = number unless number.zero?
		end
		inv
	when 'shortcut'
		value
	when 'spell_list'
		list = {}
		value.each{|spell, pow| list[spell.id] = pow}
		list
	else raise "Can't save type: #{type}"
end end