
# fonctions des commandes admin diverses

class Actor
	def cmd_dump var = nil
		unless var
			wiz "Affichage des envois #{($dump = $dump ? false : true) ? '' : 'dés'}activé."
		else
			echo :top_show, "<pre>#{CGI.escapeHTML eval(var).inspect}</pre>"
		end
	end
	
	def cmd_load path
		path << '.rb' if path[-3..-1] != '.rb'
		begin
			load path
			wiz 'Fichier chargé.'
		rescue LoadError
			wiz 'Erreur: ' << $!.to_s
		end
	end
end
