
def Dat.clone type, value, olc = nil
	case type
	when 'Actor'
		value
	when 'Area'
		value
	when 'Room'
		value
	when 'bool'
		value
	when 'Fixnum'
		value
	when 'String'
		value.clone
	when 'Symbol'
		value
	when 'value'
		value.clone
	when 'area_list'
		value.clone
	when 'Array'
		value.clone
	when 'Equipement'
		value.clone
	when 'exit_list'
		value.clone
	when 'Hash'
		value.clone
	when 'Inventory'
		value.clone
	when 'shortcut'
		[value[0].clone, value[1].clone]
	when 'spell_list'
		value.clone
	else raise "Can't clone type: #{type}"
end end
