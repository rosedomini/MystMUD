
class TCPSocket
	attr_reader :h, :flood, :control
	attr_writer :h, :flood, :control
	
	def init_guest
		@flood = 0
		@control = :start
		# set_encoding "UTF-16BE"
		# set_encoding "UTF-8"
		# set_encoding "ISO-8859-1"
	end
	
	def e
		'e' if @desc and @desc[:sex] and @desc[:sex] == 2
	end
	
	def echo name, *args
		if args.empty?
			write "\0\0" << ExtCmd[name]
		else
			params = ''
			args.each do |arg|
				params << [arg.bytesize].pack('n').force_encoding(UTF8) << arg.force_encoding(UTF8)
			end
			write [params.bytesize].pack('n').force_encoding(UTF8) << ExtCmd[name] << params
		end
	end
	
	def eject reason = nil
		wiz reason if reason
		@h.logout if @h
		$guest.delete self
		close
	end
	
	def off
		begin eof
		rescue
			Kernel.puts "server/guest.rb:#{__LINE__} #{$!.inspect}"
			true
		end
	end
	
	def start arg
		return if arg == '&lt;policy-file-request/&gt;'
		@login_heroe = $heroe.each_value{|heroe| break heroe if heroe.name.same arg}
		if @login_heroe.is_a? Heroe
			@control = :login_password
			wiz "Entrez un mot de passe pour #{@login_heroe} :"
		else @login_heroe = nil
			if arg =~ /^\w{3,10}$/
				arg.downcase!
				arg.capitalize!
				wiz "Bienvenue #{@name = arg}!<br>\
Entrez un mot de passe pour votre nouveau personnage ou <i><b>@</b></i> pour <u>annuler</u>."
				@control = :register_password
			else
				wiz 'Merci d\'entrer un nom de 3 à 10 <u>lettres</u>.'
			end
		end
	end
	
	def login_password arg
		if @login_heroe.password == Digest::MD5.hexdigest(arg)
		
			$guest.select{|guest| guest.h == @login_heroe}.each do |guest|
				guest.eject 'Une autre instance réclame ce personnage.'
			end
			
			@h = @login_heroe
			@h.room << $actor[@h.id] = @h
			@control = :normal
			
			Kernel.puts "login: #{@h.name}\n"
			
			@h.login self
		else
			wiz 'Mot de passe erroné.<br>Entrez votre nom :'
			@control = :start
		end
	end
	
	def register_password arg
		if arg == '@'
			wiz 'Annulation.<br><br>Entrez votre nom:'
			@control = :start
		elsif arg =~ /^(\w|\d){5,13}$/
			wiz "Votre mot de passe est <b>#{arg}</b>. \
Vous pourrez le changer via la commande <b>option</b>.<br>\
Une voix profonde et mystérieuse vous parle.<br>\
Cliquez sur un des liens ou entrez au clavier votre choix.<br>\
<br><font color=green>Serez-vous \
un #{'homme'.link 1} ou une #{'femme'.link 2} ?</font>"

			@desc = {}
			@password = Digest::MD5.hexdigest(arg)
			@control = :desc_sex
		else
			wiz 'Le mot de passe doit être formé par 5 à 13 caractères alphanumériques.'
		end
	end
	
	def desc_sex arg
		if 'homme'.contains arg then arg = 1
		elsif 'femme'.contains arg then arg = 2 end
		if (arg = arg.to_i).zero? or arg > 2
			wiz 'Ceci ne figure pas parmis les choix.', :red
		else
			s = case @desc[:sex] = arg
				when 1 then 'Un homme, vous serez.'
				when 2 then 'Une femme, vous serez.'
			end
			wiz "<font color=#3399CC>#{s}</font><br>\
<br>Vous percevez maintenant des echos de l'écriture d'une plume, \
sur ce qui pourrait-être un parchemin d'une qualité inestimable.<br>\
<br><font color=green>Serez vous \
gauch#{ere = e ? 'ère' : 'er'} ou droiti#{ere} ?</font><br> \
- #{"gauch#{ere}".link 1}<br> - #{"droiti#{ere}".link 2}"

			@control = :desc_hand
		end
	end
	
	def desc_hand arg
		if "gauch#{ere = e ? 'ère' : 'er'}".contains arg then arg = 1
		elsif "droiti#{ere}".contains arg then arg = 2 end
		if (arg = arg.to_i).zero? or arg > 2
			wiz 'Ceci ne figure pas parmis les choix.', :red
		else
			s = case arg
			when 1
				@ambidexterity = 1
				"Gauch#{ere}, vous serez."
			when 2
				@ambidexterity = 100
				"Droiti#{ere}, vous serez."
			end
			wiz "<font color=#3399CC>#{s}</font><br><br>\
<font color=green>De quelle taille serez-vous ?</font><br> \
- #{'de petite taille'.link 1}<br> - #{'de taille moyenne'.link 2}<br> \
- #{'de grande taille'.link 3}<br> - #{'d\'une taille immense !'.link 4}"

			@control = :desc_height
		end
	end
	
	def desc_height arg
		if 'de petite taille'.contains arg then arg = 1
		elsif 'de taille moyenne'.contains arg then arg = 2
		elsif 'de grande taille'.contains arg then arg = 3
		elsif 'd\'une taille immense !'.contains arg then arg = 4 end
		if (arg = arg.to_i).zero? or arg > 4
			wiz 'Ceci ne figure pas parmis les choix.', :red
		else
			s = case @desc[:height] = arg.to_i
				when 1 then "Petit#{e}, vous serez."
				when 2 then 'De taille moyenne, vous serez.'
				when 3 then "Grand#{e}, vous serez."
				when 4 then 'Immense ! Pourquoi pas.'
			end
			wiz "<font color=#3399CC>#{s}</font><br><br>\
<font color=green>De quelle couleur seront vos cheveux ?</font><br> \
- #{'roux'.link 1}<br> - #{'blonds'.link 2}<br> - #{'blonds cendrés'.link 3}<br> \
- #{'bruns'.link 4}<br> - #{'noirs'.link 5}"

			@control = :desc_haircolor
		end
	end
	
	def desc_haircolor arg
		if 'roux'.contains arg then arg = 1
		elsif 'blonds'.contains arg then arg = 2
		elsif 'blonds cendrés'.contains arg then arg = 3
		elsif 'bruns'.contains arg then arg = 4
		elsif 'noirs'.contains arg then arg = 5
		elsif 'blancs'.contains arg then arg = 6 end
		if (arg = arg.to_i).zero? or arg > 6
			wiz 'Ceci ne figure pas parmis les choix.', :red
		else
			s = case @desc[:haircolor] = arg
				when 1 then 'Vos cheveux seront roux.'
				when 2 then 'Vos cheveux seront blonds.'
				when 3 then 'Vos cheveux seront blonds cendrés.'
				when 4 then 'Vos cheveux seront bruns.'
				when 5 then 'Vos cheveux seront noirs.'
				when 6 then 'Vos cheveux seront blancs.'
			end
			wiz "<font color=#3399CC>#{s}</font><br>\
<br><font color=green>De quelle longueur seront vos cheveux ?</font><br> 
- #{'chauves'.link 1}<br> - #{'très courts'.link 2}<br> - #{'cours'.link 3}<br> \
- #{'de longeur moyenne'.link 4}<br> - #{'mi-longs'.link 5}<br> \
- #{'longs'.link 6}<br> - #{'très longs'.link 7}."

			@control = :desc_hairlength
		end
	end
	
	def desc_hairlength arg
		if 'chauves'.contains arg then arg = 1
		elsif 'courts'.contains arg then arg = 3
		elsif 'très courts'.contains arg then arg = 2
		elsif 'longs'.contains arg then arg = 6
		elsif 'mi-longs'.contains arg then arg = 5
		elsif 'très longs'.contains arg then arg = 7
		elsif 'de longueur moyenne'.contains arg then arg = 4 end
		if (arg = arg.to_i).zero? or arg > 7
			wiz 'Ceci ne figure pas parmis les choix.', :red
		else
			s = case @desc[:hairlength] = arg
				when 1 then 'Chauve, vous serez.'
				when 2 then 'Vos cheveux seront très courts.'
				when 3 then 'Vos cheveux seront courts.'
				when 4 then 'Vos cheveux seront de taille moyenne.'
				when 5 then 'Vos cheveux seront moyennement longs.'
				when 6 then 'Vos cheveux seront longs.'
				when 7 then 'Vos cheveux seront très longs.'
			end
			wiz "<font color=#3399CC>#{s}</font><br>\
<br><font color=green>De quelle couleur seront vos yeux ?</font><br> \
- #{'bleus'.link 1}<br> - #{'verts'.link 2}<br> - #{'jaunes'.link 3}<br> - \
#{'roses'.link 4}<br> - #{'violets'.link 5}<br> - #{'marrons'.link 6}"

			@control = :desc_eyecolor
		end
	end
	
	def desc_eyecolor arg
		if 'bleus'.contains arg then arg = 1
		elsif 'verts'.contains arg then arg = 2
		elsif 'jaunes'.contains arg then arg = 3
		elsif 'roses'.contains arg then arg = 4
		elsif 'violets'.contains arg then arg = 5
		elsif 'marrons'.contains arg then arg = 6 end
		if (arg = arg.to_i).zero? or arg > 6
			wiz 'Ceci ne figure pas parmis les choix.', :red
		else
			@desc[:eyecolor] = arg
			@h = $heroe[id = $heroe.new_id] = Heroe.new(id)
			$actor[id] = @h
			
			name = @name
			password = @password
			desc = @desc
			ambidexterity = @ambidexterity
			@name = @password = @desc = @ambidexterity = nil
			
			@h.instance_eval do
				@name = name
				@password = password
				@authlevel = 0
				@desc = desc
				(@room = $room[7]) << self
				@xp = 0
				@level = 1
				@maxhp = 20
				@hp = 20
				@maxmp = 10
				@mp = 10
				@str = 5
				@con = 5
				@wis = 5
				@dex = 5
				@armor = 0
				@ambidexterity = ambidexterity
				@skin = 'default'
				@avatar = 'default'
				@target = nil
				@spell = {}
				@inv = Inventory.new
				@equip = {}
				@shortcut = Actor::Shortcut
				@hunger = 0
				after_load
				show_shortcuts
			end
			wiz '<font color=#3399CC>Les milliers de filaments de connexion de votre âme illuminée s\'emparent du corps d\'un Fœtus qui n\'a pas tardé à devenir un nouveau né. Vous incarnez maintenant ce personnage et pourrez apprendre à vous en servir.</font><br><br>Ci-dessous se trouve la description de l\'endroit ou vous vous trouvez.'
			@control = :normal
			@h.login self
		end
	end
	
	def normal arg; @h.cmd arg end
	
	def require_current_password_to_change_it arg
		if Digest::MD5.hexdigest(arg) == @h.password
			wiz 'Entrez votre nouveau mot de passe :'
			@control = :require_new_password
		else
			wiz 'Mot de passe erroné. <a href="javascript:p(\'option password\')">Cliquez ici</a> pour réessayer.'
			@control = :normal
		end
	end
	
	def require_new_password arg
		if arg =~ /^(\w|\d){5,13}$/
			@h.password = @password = Digest::MD5.hexdigest(arg)
			wiz 'Votre mot de passe est désormais actif, ne l\'oubliez pas !'
			@control = :normal
		else
			wiz 'Le mot de passe doit être formé par 5 à 13 caractères alphanumériques.'
			wiz 'Entrez votre nouveau mot de passe :'
		end
	end
	
	def require_password_to_delete_character arg
		if Digest::MD5.hexdigest(arg) == @h.password
			Task.add @h, :delete_character, 0, -5
			wiz "Votre personnage sera supprimé définitivement d'ici 40 secondes. <br>\
Tapez <i><b>option cancel</b></i> pour annuler. <br><br>Vous pouvez assister à sa \"true death\", ou vous déconnecter maintenant."
		else
			wiz "Mot de passe erroné. \
<a href=\"javascript:p('option delete character')\">Cliquez ici</a> pour réessayer."
		end
		@control = :normal
	end
	
	def wiz sth, color=nil
		if color
			echo :box_append, sth.to_s, color.to_s
		else
			echo :box_append, sth.to_s
		end
	end
end
