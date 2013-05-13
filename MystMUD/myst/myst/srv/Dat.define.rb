
Clonable = [Item, Mob]

class Dat
	ClassVoc = { # true pour féminin
		Area    => ['zone',     'zones',     true],
		Avatar  => ['avatar',   'avatars',  false],
		Body    => ['corps',    'corps',    false],
		Command => ['commande', 'commandes', true],
		Heroe   => ['héros',    'héros',    false],
		Item    => ['objet',    'objets',   false],
		Mob     => ['créature', 'créatures', true],
		Room    => ['salle',    'salles',    true],
		Shop    => ['magasin',  'magasins', false],
		Skin    => ['skin',     'skins',    false],
		Spell   => ['sort',     'sorts',    false],
		System  => ['système',  'systèmes', false],
		World   => ['monde',    'mondes',   false],
	}
end

class << Dat
	def define
		# Aff?
		[Area, Avatar, Body, Command, Heroe, Item, Mob,
			Room, Shop, Skin, Spell, System, World].each do |klass|
			self.send klass.to_s
		end
		
		# Aff?
		add_to_OLC Area, Body, Heroe, Item, Mob, Room, Shop, World
	end
	
	def add_to_OLC *classes
		classes.each do |klass|
			a = OLC[klass] = []
			$data[klass].data.each{|x| a << x[:name].to_s}
			Map[klass] = $data[klass].hash
	end end

	def Aff
		data = $data[Aff] = new(:Aff, $aff, Aff)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $avatar[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x.length < 100}
	end end
	
	def Area
		data = $data[Area] = new(:Area, $area, Area)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $area[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x.length < 100}
	end end
	
	def Avatar
		data = $data[Avatar] = new(:Avatar, $avatar, Avatar)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $avatar[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x.length < 50}
			add(1, :source, 'String'){|x| x =~ /^(mob\.)?\w{3, 150}$/}
	end end
	
	def Body
		data = $data[Body] = new(:Body, $body, Body)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $body[x].nil? and x > 0}
			add 3, :actor, 'Actor'
			add(1, :name, 'String'){|x| x =~ /^[\w ]{5, 100}$/}
			add(1, :expire, 'Fixnum'){|x| x > 0}
			add 2, :inv, 'Inventory'
			add 2, :room, 'Room'
	end end
	
	def Command
		data = $data[Command] = new(:Command, $command, Command)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $command[x].nil?}
			add(1, :name, 'String'){|x| x =~ /^\w{1, 30}$/ and Command.named(x).nil?}
			add(1, :french_name, 'String'){|x| x.length < 30}
			add(1, :type, 'Symbol'){|x| Command::Types.include? x}
			add 1, :mob, 'bool'
			add 1, :ko, 'bool'
			add(1, :authlevel, 'Fixnum'){|x| x.between? 0, 100}
			add 1, :keyboard, 'bool'
			add 1, :link, 'bool'
			add 1, :syntax, 'command_syntax'
			add 1, :help, 'command_help'
	end end
	
	def Heroe
		data = $data[Heroe] = new(:Heroe, $heroe, Heroe)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $heroe[x].nil? and x.between? 1, 999999}
			add(1, :name, 'String'){|x| x =~ /^\w{3,10}$/ and Heroe.named(x).nil?}
			add(1, :password, 'String'){|x| x.length < 300}
			add(1, :authlevel, 'Fixnum'){|x| x.between? 1, 100}
			add 1, :desc, 'Hash' do |x|
				x.size == 5 and
				x[:sex].is_a? Fixnum and x[:sex].between? 1, 2 and
				x[:height].is_a? Fixnum and x[:height].between? 1, 4 and
				x[:haircolor].is_a? Fixnum and x[:haircolor].between? 1, 6 and
				x[:hairlength].is_a? Fixnum and x[:hairlength].between? 1, 7 and
				x[:eyecolor].is_a? Fixnum and x[:eyecolor].between? 1, 6
			end
			add 2, :room, 'Room'
			add(2, :xp, 'Fixnum'){|x| x.between? 0, $x.xp_needed - 1}
			add(1, :level, 'Fixnum'){|x| x.between? 1, 100}
			add(2, :hp, 'Fixnum'){|x| x.between? 1, $x.maxhp}
			add(1, :maxhp, 'Fixnum'){|x| x.between? 1, 1000000}
			add(2, :mp, 'Fixnum'){|x| x.between? 1, $x.maxmp}
			add(1, :maxmp, 'Fixnum'){|x| x.between? 1, 1000000}
			add(1, :str, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :con, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :wis, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :dex, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :armor, 'Fixnum'){|x| x.between? 0, 1000}
			# De gaucher pur (1) à droitier pur (100) en passant par ambidextre (50)
			add(1, :ambidexterity, 'Fixnum'){|x| x.between? 1, 100}
			add(1, :skin, 'String'){|x| x.length < 50}
			add(1, :avatar, 'String'){|x| x.length < 50}
			add 2, :spell, 'spell_list'
			add 2, :inv, 'Inventory'
			add 2, :equip, 'Equipement'
			add 1, :shortcut, 'shortcut'
			add(1, :hunger, 'Fixnum'){|x| x < 1201}
	end end
	
	def Item
		data = $data[Item] = new(:Item, $item, Item)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $item[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x =~ /^[\w ]{5, 100}$/}
			add(1, :type, 'Symbol'){|x| Item::Types.include? x}
			add(1, :weight, 'Fixnum'){|x| x >= 0}
			add 1, :fixed, 'bool'
			add(1, :implantation, 'String'){|x| x =~ /^[\w ]{5, 200}$/}
			add(1, :wearon, 'Array'){|x| true if (x - Actor::Equip.keys).empty?}
			add(1, :desc, 'String'){|x| x.length < 1000}
			add 1, :stats, 'Hash' #
			add 1, :power, 'Hash' #
			add 1, :required, 'Hash' #
			add(1, :value, 'Fixnum'){|x| x > 0}
	end end
	
	def Mob
		data = $data[Mob] = new(:Mob, $mob, Mob)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $mob[x].nil? and x > 999999}
			add(1, :name, 'String'){|x| x =~ /^[\w ]{1,80}$/}
			add 2, :room, 'Room'
			add(1, :level, 'Fixnum'){|x| x.between? 1, 100}
			add(2, :hp, 'Fixnum'){|x| x.between? 1, $x.maxhp}
			add(1, :maxhp, 'Fixnum'){|x| x.between? 1, 1000000}
			add(2, :mp, 'Fixnum'){|x| x.between? 1, $x.maxmp}
			add(1, :maxmp, 'Fixnum'){|x| x.between? 1, 1000000}
			add(1, :str, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :con, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :wis, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :dex, 'Fixnum'){|x| x.between? 1, 1000}
			add(1, :armor, 'Fixnum'){|x| x.between? 0, 1000}
			# De gaucher pur (1) à droitier pur (100) en passant par ambidextre (50)
			add(1, :ambidexterity, 'Fixnum'){|x| x.between? 1, 100}
			add(1, :skin, 'String'){|x| x.length < 50}
			add(1, :avatar, 'String'){|x| x.length < 50}
			add 2, :spell, 'spell_list'
			add 2, :inv, 'Inventory'
			add 2, :equip, 'Equipement'
	end end
	
	def Room
		data = $data[Room] = new(:Room, $room, Room)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $room[x].nil? and x > 0}
			add 2, :area, 'Area'
			add(1, :background, 'String'){|x| x.length < 50}
			add(1, :name, 'String'){|x| x.length < 80}
			add(1, :desc, 'String'){|x| x.length < 1000}
			add(1, :x, 'Fixnum'){|x| x.between? -10000, 10000}
			add(1, :y, 'Fixnum'){|x| x.between? -10000, 10000}
			add(1, :z, 'Fixnum'){|x| x.between? -10000, 10000}
			add 2, :inv, 'Inventory'
			add 2, :items, 'Inventory'
			add 2, :exits, 'exit_list'
	end end
	
	# crée une nouvelle salle à l'emplacement voulu
	def createRoom x = 0, y = 0, z = -1
		($room << room = Room.new).instance_eval do
			@x		= x
			@y		= y
			@z		= z
			@area	= (near = Room.near self).area
			@background = near.background
			@name	= 'Nouvelle salle'
			@desc	= 'Cette salle est bien éclairée et sent bon la peinture fraîche.'
			@inv		= Inventory.new
			@items	= Inventory.new
			@exits	= {}
			after_load
		end
		room
	end
	
	def Shop
		data = $data[Shop] = new(:Shop, $shop, Shop)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $shop[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x.length < 80}
			add(2, :keeper, 'Fixnum'){|x| $mob[x]}
			add 2, :room, 'Room'
			add 2, :inv, 'Inventory'
			add 2, :items, 'Inventory'
	end end
	
	def Skin
		data = $data[Skin] = new(:Skin, $skin, Skin)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $skin[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x.length < 50}
			add(1, :source, 'String'){|x| x =~ /^(mob\.)?\w{3, 150}$/}
	end end
	
	def Spell
		data = $data[Spell] = new(:Spell, $spell, Spell)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $spell[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x.length.between? 1, 70}
			add(1, :desc, 'String'){|x| x.length < 1000}
			add(1, :min_cost, 'Fixnum'){|x| x.between? 0, 1000000}
			add(2, :max_cost, 'Fixnum'){|x| x.between? $x.min_cost, 1000000}
			add(1, :school, 'String'){|x| Spell::Schools.include? x}
			add 1, :func, 'Symbol'
			add 1, :arg_target, 'bool'
	end end
	
	def System
		data = $data[System] = new(:System, $system, System)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| x > 0}
			add(1, :name, 'String'){|x| $system[x].nil? and x.length.between? 1, 70}
			add 3, :value, 'value'
	end end
	
	def World
		data = $data[World] = new(:World, $world, World)
		data.instance_eval do
			add(1, :id, 'Fixnum'){|x| $world[x].nil? and x > 0}
			add(1, :name, 'String'){|x| x.length.between? 1, 70}
			add 2, :areas, 'area_list'
	end end
end
