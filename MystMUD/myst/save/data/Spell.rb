#Spell 1
{
	:@id => 1,
	:@name => "Boule de feu",
	:@desc => "Envoie une boule de feu sur l'adversaire.",
	:@min_cost => 1,
	:@max_cost => 20,
	:@school => "Magie noire",
	:@func => :cast_boule_de_feu,
	:@arg_target => true,
},

#Spell 2
{
	:@id => 2,
	:@name => "Bouclier",
	:@desc => "Invoque un bouclier magique de couleur nacre autours de la cible.",
	:@min_cost => 10,
	:@max_cost => 30,
	:@school => "Magie blanche",
	:@func => :cast_bouclier,
	:@arg_target => true,
},

#Spell 4
{
	:@id => 4,
	:@name => "Invisibilit\u00E9",
	:@desc => "Permet de rendre invisible votre cible ou vous-m\u00EAme. Si vous l'\u00EAtes d\u00E9j\u00E0, ce sort vous fera retrouver votre apparence ordinaire.",
	:@min_cost => 10,
	:@max_cost => 40,
	:@school => "Affinit\u00E9s \u00E0 la nature",
	:@func => :"cast_invisibilit\u00E9",
	:@arg_target => true,
},

#Spell 3
{
	:@id => 3,
	:@name => "Soin",
	:@desc => "Permet de vous soigner vous ou quelqu'un d'autre.",
	:@min_cost => 10,
	:@max_cost => 40,
	:@school => "Magie blanche",
	:@func => :cast_soin,
	:@arg_target => true,
},

