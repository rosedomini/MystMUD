
class Actor
	def chat sth
		$actor.wiz "#{@name} : #{sth}", :orange
	end
	
	def pray sth
		$pray_history << sth
		wiz "Message reçu !"
		$actor.select{|x, y| y.immortal? }.wiz "#{@name} prie : #{sth}", :yellow
	end
	
	def read item
		if content = $book[item.id]
			wiz "Vous lisez #{item}.<br>"
			wiz content.gsub(/#\{([^\}]+)\}/){ eval $1 }
		else wiz "Vous ne parvenez pas à lire #{item}" end
	end
	
	def reply sth
		wiz "Vous répondez à #{@last_teller} : #{sth}", :DeepPink
		@last_teller.wiz "#{@name} vous répond : #{sth}", :DeepPink
		@last_teller.last_teller = self
	end
	
	def say sth
		wiz "Vous dites : #{sth}", :green
		each_close_heroe{|x| x.wiz "#{sb? x} dit : #{sth}", :green}
		each_close_mob{|x| x.on_hear self, sth if x.respond_to? :on_hear}
	end
	
	def shout sth
		wiz "Vous criez : #{sth}", Lightblue
		$actor.no(self).wiz "#{@name} crie : #{sth}", Lightblue
	end
	
	def tell heroe, sth
		heroe.last_teller = self
		heroe.wiz "#{@name} vous dit : #{sth}", :DeepPink
		wiz "Vous dites à #{heroe} : #{sth}", :DeepPink
	end
end