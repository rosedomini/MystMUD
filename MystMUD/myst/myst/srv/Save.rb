
class Save
	@@dir = ''
	
	def self.world
		now = Time.now.to_f
		
		return if now - $lastsave < 2 
		
		$lastsave = now
		puts "\t__Recuperation des donnees de l'ancien monde__"
		
		begin Save.createBackup
		rescue
			Error.report
			puts "Erreur lors de la creation du backup. \
Sauvegarde annulee. Nouvel essai dans 3 minutes."
			if $task then $task.repeat = 180 end
			return
		end
		
		puts "\t__Sauvegarde de l'instance actuelle du monde__"
		
		begin
			$system['world_time'].value = wtime
			
			classes = [Area, Body, Heroe, Item, Mob, Room, 
				Shop, Spell, System, World]
			
			files_content = {}
			classes.each{|klass| files_content.store *$data[klass].save}
			
			print "\n\t\tEcriture des donnees"
			
			files_content.each do |file_path, data|
				file = File.open file_path, 'w+'
				file.set_encoding UTF8
				file.write data
				file.close
				data.clear
			end
			files_content.clear
			
		rescue
			Error.report
			puts "Sauvegarde echouee. Nouvel essai dans 3 minutes. (#{$query})"
			if $task then $task.repeat = 180 end
			return
		end
		
		print "\n\tNettoyage du dossier des sauvegardes"
		
		begin Save.cleanBackupDirectory
		rescue
			Error.report
			puts 'Erreur lors du nettoyage du dossier des sauvegardes.'
			$actor.each_value do |actor|
			if actor.immortal?
					actor.wiz 'Erreur lors du nettoyage du dossier des sauvegardes.',
						'red'
			end end
		end
		
		print "\n* Termine en #{((Time.now.to_f - now) * 1000).round}ms\n\n"
		
		$actor.each_value do |actor|
			if actor.immortal?
				actor.wiz "Vous voyez le temps se figer un instant \
avant de reprendre son cours normal.", 'red'
		end end
		
		if $task then $task.repeat = 1200 end
	end

	def self.createBackup
		t = Time.now
		month = "#{t.year}.#{t.month.resize 2}"
		unless File.exists?(dir = "#{ROOT}/save/old_data/#{month}")
			Dir.mkdir dir end
		unless File.exists?(dir << "/#{t.day.resize 2}")
			Dir.mkdir dir end
		time = "#{t.hour.resize 2}h#{t.min.resize 2}m#{t.sec.resize 2}"
		Dir.mkdir @@dir = "#{dir}/#{time}"
		dir = Dir.open "#{ROOT}/save/data"
		dir.each do |filename|
			if filename =~ /\.rb$/
				File.open "#{@@dir}/#{filename}", 'w+' do |new_file|
					new_file.set_encoding UTF8
					new_file.write File.read_utf8("#{ROOT}/save/data/#{filename}")
				end
			end
		end
		dir.close
	end
	
	def self.restoreBackup
		return if @@dir.empty?
		begin
			dir = Dir.open @@dir
			dir.each do |filename|
				if filename =~ /\.rb$/
					File.open "#{ROOT}/save/data/#{filename}", 'w+' do |new_file|
						new_file.set_encoding UTF8
						File.open "#{@@dir}/#{filename}" do |file|
							file.set_encoding UTF8
							new_file.write file.read
						end
					end
				end
			end
			dir.close
		rescue
			Error.report
			puts 'Echec de la restauration du backup\n'
		end
	end
	
	def self.cleanBackupDirectory
		current_date = Time.now.year*12 + Time.now.month
		current_day = Time.now.day
		
		dir = Dir.open "#{ROOT}/save/old_data"
		dir.each do |month|
			if month =~ /^((\d\d\d\d)\.(\d\d))$/
				date = $2.to_i*12 + $3.to_i
				path2 = "#{ROOT}/save/old_data/#{$1}"
				dir2 = Dir.open path2
				if date < current_date - 1
					dir2.each do |day|
						unless (day = day.to_i).zero?
							if day.to_i%7 == 1
								Save.cleanBackupDay "#{path2}/#{day.to_i.resize 2}"
							else FileUtils.rm_rf "#{path2}/#{day.to_i.resize 2}" end
						end
					end
				elsif date < current_date
					dir2.each do |day|
						unless day.to_i.zero?
							Save.cleanBackupDay "#{path2}/#{day.to_i.resize 2}"
						end
					end
				elsif date == current_date
					dir2.each do |day|
						unless (day = day.to_i).zero? or day > current_day - 2
							Save.cleanBackupDay "#{path2}/#{day.resize 2}"
						end
					end
				end
			end
		end
	end
	
	def self.cleanBackupDay path
		first = true
		dir = Dir.open path
		dir.each do |time|
			if time[0] != '.'
				if first then first = nil
				else FileUtils.rm_rf "#{path}/#{time}" end
			end
		end
	end
end
