
class << $room[15]
	def action_on_enter actor
		Task.add actor, :wiz, 0, -8, "Le vent est calme et le courant vous aide à progresser."
		Task.add actor, :wiz, 0, -12, "Un énorme poisson chat manque de \
renverser votre pirogue, qui finit par se redresser."
		Task.add actor, :wiz, 0, -19, "Vous apercevez les premières méandres du delta de l'Everdale."
		Task.add actor, :wiz, 0, -23, "Vous apercevez le phare de l'île de Sifnos !"
		Task.add actor, :move, 0, -32, $room[18], nil, nil, true
	end
end