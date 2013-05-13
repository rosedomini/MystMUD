
class Heroe < Actor
	attr_reader :desc, :msg, :shortcut, :password, :authlevel, :xp, :hunger
	attr_writer :password
	
	def after_load
		super
		@msg.clear
	end
	
	def init
		super
		@msg = ''
		@hunger = 0
	end
	
	def inspect; "$heroe[#{@id}]" end
	
	def add_xp number, share = true
		if share and @team and \
				(winners = @team.select{|x| x.room == @room}).size > 1
			number = (number / winners.size**0.4).to_i
			winners.wiz "<br>Vous acquérissez de l'expérience en équipe ~ \
<font color=#3366CC>#{number}</font> points."
			winners.each do |actor|
				actor.instance_eval do
					@xp += number
					until @xp < xp_needed
						@xp -= xp_needed; level_up
			end end end
		else
			wiz "<br>Vous acquérissez de l'expérience ~ \
<font color=#3366CC>#{number}</font> points."
			@xp += number
			until @xp < xp_needed
				@xp -= xp_needed; level_up
	end end end
	
	def delete_character
		Heroe.online.wiz "&nbsp~ Une série d'éclairs éblouïssants s'abat sur \
#{@name}, paralysant chaque partie de son corps. ~", :red

		killed
		logout true if online?
		@room >> self
		$heroe.delete @id
		@destroyed = true
		freeze
	end
	
	def echo name, *args
		if args.empty?
			@msg << "\0\0" << ExtCmd[name]
		else
			params = ''
			args.each do |arg|
				params << [arg.bytesize].pack('n').force_encoding(UTF8) << arg.dup.force_encoding(UTF8)
			end
			@msg << [params.bytesize].pack('n').force_encoding(UTF8) << ExtCmd[name] << params
		end
	end
	
	def heroe?; true end
	
	def hunger= value
		if @hunger < value
			@hunger = if value < 0 then 0
			elsif value > 1200 then wiz 'Vous êtes complètement rassasié.'; 1200
			else value end
		elsif (@hunger = value) < 0
			wiz "Vous avez #{'très '*(-value/1800).to_i}faim."
	end end
	
	def killed actor = nil
		
		wiz ' '
		unless @equip.empty?
			@equip.each_key do |on| remove on end
			wiz ' '
		end
	
		fatality = case rand 3
			when 0 then 'tombe raide mort'
			when 1 then 'expire son dernier souffle'
			else				 's\'écroule dans une mare de sang'
		end
		
		wiz 'Vous vous écroulez, vide d\'énergie...<br>', :red
		close_heroes.wiz "#{@name} #{fatality}."
		
		actor.add_xp xp_gives(actor) if actor and actor.heroe?
		
		body = $body << Body.new.create(self, 720, @room)
		body_inv = body.inv = @inv.clone
		
		@inv.clear
		@status = :none
		@hp = @maxhp
		get_peace
		
		cmd_team :leave if @team
		
		@room >> self
		(@room = $room[1]) << self
		look_around
	end
	
	def level_up
		@level += 1
		wiz('<b>Vous progressez d\'un niveau ! Votre ' <<
		case rand 4
			when 0 then @dex += 3; 'dextérité'
			when 1 then @wis += 3; 'sagesse'
			when 2 then @con += 3; 'constitution'
			when 3 then @str += 3; 'force'
		end << ' augmente.</b>', :yellow)
		@maxhp += @con
		@maxmp += @wis
		@hp = @maxhp
		@mp = @maxmp
	end
	
	def mob?; end
	def online?; $actor.key self end
	
	def login sock
		@msg.clear
		@sock = sock
		@target = nil
		look_around
		show_shortcuts
		redit true if immortal? and @redit
	end
	
	def logout write_MOTD = false
		cmd_team :leave if @team
		@following = nil
		$actor.each_value{|x| x.follow if x.following == self}
		@target = nil
		get_peace
		@target = nil
		send_msg
		@room >> self
		$actor.delete @id
		if write_MOTD
			begin
				@sock.write "\0\0#{ExtCmd[:stats_clear]}\0\0#{ExtCmd[:top_clear]}#{Server_MOTD}"
			rescue; end
		end
		@sock.control = :start
		@sock.h = nil
		@sock = nil
	end
	
	def send_msg force = nil
		return if @msg.length.zero? and !force
		
		if target
			echo :enemy_show, @target.name,
				[@target.hp, @target.maxhp].pack('nn')
		end
		
		if @team
			@team.no(self).each do |x|
				echo :team_update, [x.id, x.hp, x.maxhp, x.mp, x.maxmp,
				x.hp_arrows_useful, x.mp_arrows_useful ].pack('NnnnnCC')
		end end

		echo :stats_update, [@hp, @maxhp, @mp, @maxmp,
			hp_arrows_useful, mp_arrows_useful ].pack('nnnnCC')
		
		# if @msg.length > 2048
			# (@msg.length.to_f / 2048).ceil.times{|i| @sock.write @msg[i*2048, 2048]}
		# else @sock.write @msg end
		begin
			@sock.write @msg
		rescue; end
		
		if $dump
			puts "\nEnvoi du message :"
			p @msg
			puts "A #{@sock}\n"
		end
		
		@msg.clear
	end
	
	def show_shortcuts
		args = []
		commands = @shortcut[1]
		@shortcut[0].each_with_index do |icon, i|
			args << icon << commands[i]
		end
		echo :shortcuts_show, *args
	end
	
	def wiz sth, color=nil
		if color
			echo :box_append, sth.to_s, color.to_s
		else
			echo :box_append, sth.to_s
		end
	end
	
	def xp_needed; 2*(@level**2)*(@level+50)*(1+0/3) end # replace 0 with @ren
end

class << Heroe
	def named name; $heroe.value_named name end
	
	def online
		online = []
		$actor.each_value{|x| online << x if x.heroe?}
		online
	end
end
