
def Dat.instantiate type, value, olc = nil
	case type
	when 'Area'
		value.instances[$x.instance]
	when 'Room'
		value.instances[$x.instance]
	when 'bool'
		value
	when 'Fixnum'
		value
	when 'String'
		value.clone
	when 'Symbol'
		value
	when 'Array'
		value.clone
	when 'Equipement'
		value.clone
	when 'exit_list'
		value.values.collect!{|x| x.instances[$x.instance]}
	when 'Hash'
		value.clone
	when 'Inventory'
		value.clone
	when 'spell_list'
		value.clone
	else raise "Can't instantiate a value of type #{type} from #{$x.inspect}"
end end
