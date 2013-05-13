
class Actor
	def affect_bouclier time, power; @mp_arrows += 1; send_msg true if heroe? end
	def unaffect_bouclier time, power; @mp_arrows -= 1; send_msg true if heroe? end
end