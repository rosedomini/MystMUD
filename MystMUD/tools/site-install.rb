ROOT = Dir.pwd
require 'fileutils'
require '../lib/file_utf8'
require '../lib/backup'

puts 'Wich site are we working on?'
dir = "../#{site = gets.strip}"

loop do
 puts 'Enter:
1 to install the backup system
2 to install the settings.rb
3 to install the handlers ruby-cgi.rb and ruby-fcgi.rb
4 to install the default site (htdocs)
5 to create the logs directory'
 case gets.to_i
 when 1
  Dir.mkdir "#{dir}/data"
  Dir.mkdir "#{dir}/data/current"
  Dir.mkdir "#{dir}/data/old"
 when 2
  File.write_utf8 "#{dir}/settings.rb", "ROOT= # important
 \"\#{'C:' if Dir.pwd[0] != '/'}/site/#{site}\".freeze
\nDir.chdir ROOT"
 when 3
  Dir.mkdir "#{dir}/bin"
  FileUtils.copy 'default/bin/ruby-cgi', "#{dir}/server/ruby-cgi"
  FileUtils.copy 'default/bin/ruby-fcgi', "#{dir}/server/ruby-fcgi"
 when 4
  Backup.unzip_dir 'default-site.zip', "#{dir}/site"
 when 5
  Dir.mkdir "#{dir}/logs"
  Dir.mkdir "#{dir}/logs/errors"
 else next end
 puts 'Done.'
end