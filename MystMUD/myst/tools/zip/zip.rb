
require 'date'
require 'settings'
require 'myst/func/ruby_def'

puts 'Add a note: '
note = gets.strip

t = Time.now
time = "#{t.day.resize 2}.#{t.hour.resize 2}h#{t.min.resize 2}"
path = "#{t.year.resize 2}/#{t.month.resize 2}".gsub! '/', '\\'
myst_path = "#{ROOT}/save/myst/#{path}"
site_path = "#{ROOT}/save/site/#{path}"
zip = "#{ROOT}/tools/zip/7-Zip/7z".gsub! '/', '\\'

puts "Compression of myst to #{myst_path}"
`"#{zip}" a -tzip "#{myst_path}/#{time}.zip" "#{"#{ROOT}/myst".gsub '/', '\\'}"`
puts "Compression of the site to #{site_path}"
`"#{zip}" a -tzip "#{site_path}/#{time}.zip" "#{"#{ROOT}/site".gsub '/', '\\'}"`
puts 'Done'

if note.length > 1
	[myst_path, site_path].each do |path|
		File.open "#{path.gsub '\\', '/'}/#{time} - #{note}", 'w+' do |file|
			file.write note
		end
	end
end
