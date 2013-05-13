begin
 require 'fileutils'
 dir = 'c:/program files/lighttpd/conf'

 puts 'Enter a part of the name of the configuration file to use'
 conf = gets.strip
 Dir.open(dir).each do |file|
  if file.index conf
   FileUtils.rm_rf "#{dir}/current.conf"
   FileUtils.copy "#{dir}/#{file}", "#{dir}/current.conf"
   puts "Enabled conf: #{file}"
  end
 end
rescue
 puts $!
ensure
 puts `pause`
end