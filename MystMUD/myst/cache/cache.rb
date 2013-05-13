
TIME           = 0
ONLINE_PLAYERS = 1

ROOMS   = 0
AREAS   = 1
ITEMS   = 2
MOBS    = 3
HEROES  = 4
SHOPS   = 5
SPELLS  = 6
SKINS   = 7
AVATARS = 8

def delete_cache name
	File.delete "#{ROOT}/cache/#{name}.dat"
end

def set_cache name, value
	File.open "#{ROOT}/cache/#{name}.dat", 'w+' do |file|
		file.write value
	end
end

def get_cache name
	File.read "#{ROOT}/cache/#{name}.dat"
end
