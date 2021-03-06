﻿
def pretty_time s
	j = h = m = nil
	 if s >= 86400 then j = s/86400; s %= 86400 end
	 if s >= 3600 then h = s/3600; s %= 3600 end
	 if s >= 60 then m = s/60; s %= 60 end
	 "#{"#{j}j " if j}#{"#{h}h " if h}#{"#{m}min " if m}#{s}s"
end

def wtime
	return (Time.now.to_i - $system['time_difference'].value).to_i
end

def wdate what = nil
	mins = wtime / 5
	
	years = mins / (11 * 5 * 7 * 22 * 60)
	mins -= years * (11 * 5 * 7 * 22 * 60)
	
	month = mins / (5 * 7 * 22 * 60)
	mins -= month * (5 * 7 * 22 * 60)
	
	weeks = mins / (7 * 22 * 60)
	mins -= weeks * (7 * 22 * 60)
	
	days = mins / (22 * 60)
	mins -= days * (22 * 60)
	
	hours = mins / 60
	mins -= hours * 60
	
	date = {
		'year' => years + 1,
		'month' => World::Month[month + 1],
		'week' => weeks + 1,
		'day' => days + 1,
		'hours' => hours,
		'minutes' => mins
	}
	return what ? date[what] : date
end

=begin

	1 an = 11 mois = 29 jours 8h50 réel
	1 mois = 5 semaines = 2 jours 16h10 réel
	1 semaine = 7 jours = 12h50 réel
	1 jour = 22 heures = 1h50 réel
	1 heure = 60 minutes = 5 minutes réelles
	1 minute = 5 secondes réelles

		Mois :
		
	1 - Oxtanpus
	2 - Arcanbis
	3 - Penolpi
	4 - Myha
	5 - Poljin
	6 - Fyul
	4 - Brhon
	5 - Mist
	7 - Adrea
	8 - Neptus
	9 - Sircanceas
	10 - Learius
	11 - Tarnas

=end
