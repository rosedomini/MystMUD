# server settings

ROOT = # important
	"#{'E:' if Dir.pwd[0] != '/'}/var/rails/myst/MystMUD/myst".freeze

SERVER_SETTINGS = {
	'hostname' => # important
		(ROOT[1] == ':' ? '127.0.0.1' : '176.31.184.68').freeze,
	'port' => 6021,
	'clients limit' => 100,
	'flood limit' => 50, # commands per second
}.freeze

Dir.chdir ROOT
$: << ROOT