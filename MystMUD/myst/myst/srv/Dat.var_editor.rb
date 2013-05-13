 
 def Dat.var_editor klass, id, type, var, v, rows
 
	default = "<textarea rows=\"#{rows}\" id=\"olcv_#{var}\" cols=60>#{v}</textarea></td>\
<td><input type=button onclick=\"p('set #{klass} #{id} #{var} '\
+replacen(el('olcv_#{var}').value))\" value=OK>"
 
	case klass
	when 'Mob'
		case var
		when 'skin'
			"<div id=select_skin><p align=center><img title=\"#{v}\" \
src=\"ico/chars/#{v}.png\" onclick=\"p('varEdit Mob:skin #{id}')\"></p></div></td><td>"
		when 'avatar'
			"<div id=select_avatar><p align=center><img title=\"#{v}\" \
src=\"ico/avatar/#{v}.png\" onclick=\"p('varEdit Mob:avatar #{id}')\"></p></div></td><td>"
		else default end
	else default end
 end