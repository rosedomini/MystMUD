require 'fileutils'
require 'zip/zip'

unless defined? UTF8
 UTF8 = Encoding.find 'UTF-8' end
unless defined? ROOT
 raise 'Constant undefined: ROOT' end

class BackupHandler
 attr_accessor :root, :interval, :clean, :last, :on_success
 
 def initialize root = "#{ROOT}/data", interval = 1800, clean = true
  @root= root
  @interval = interval
  @clean = clean
  @last= ''
  @on_success = nil
 end

 def start time_limit = nil
  time = 0
  while time_limit.nil? or time < time_limit
   sleep interval
   create
   time += interval
  end
 end
 
 def zip_dir dir, archive
  dir.sub!(/\/$/, '')
  Zip::ZipFile.open archive, 1 do |zip|
   Dir["#{dir}/**/**"].each do |file|
    zip.add file.sub("#{dir}/", ''), file if file != archive
   end
  end
 end

 def unzip_dir archive, destination
  Zip::ZipFile.open archive do |zip|
   zip.each do |entry|
    file = "#{destination}/#{entry.name}"
    FileUtils.mkdir_p File.dirname(file)
    zip.extract entry, file
   end
  end
 end

	def create
		month = "#{(t = Time.now).year}.#{t.month.resize 2}"
		dir = "#{@root}/old/#{month}/#{t.day.resize 2}"
		FileUtils.mkdir_p dir
		time = "#{t.hour.resize 2}h#{t.min.resize 2}m#{t.sec.resize 2}"
		@last = "#{dir}/#{time}.zip"
  zip_dir "#{@root}/current", "#{@last}"
  @on_cussess.call if @on_success
  clean if @clean
	end
	
 def clean
  current_date = (t= Time.now).year*12 + t.month
  current_day = t.day
  
  dir = Dir.open "#{@root}/old"
  dir.each do |month|
   if month =~ /^((\d\d\d\d)\.(\d\d))$/
    date = $2.to_i*12 + $3.to_i
    path2 = "#{@root}/old/#{$1}"
    dir2 = Dir.open path2
    if date < current_date - 1
     dir2.each do |day|
      unless (day = day.to_i).zero?
       if day.to_i%7 == 1
        clean_day "#{path2}/#{day.to_i.resize 2}"
       else FileUtils.rm_rf "#{path2}/#{day.to_i.resize 2}" end
      end
     end
    elsif date < current_date
     dir2.each do |day|
      unless day.to_i.zero?
       clean_day "#{path2}/#{day.to_i.resize 2}"
      end
     end
    elsif date == current_date
     dir2.each do |day|
      unless (day = day.to_i).zero? or day > current_day - 2
       clean_day "#{path2}/#{day.resize 2}"
      end
     end
    end
   end
  end
 end
	
 def clean_day path
  first = true
  dir = Dir.open path
  dir.each do |time|
   if time[0] != '.'
    if first then first = nil
    else FileUtils.rm_rf "#{path}/#{time}.zip" end
   end
  end
 end
	
 def restore
  begin
   unless @last.empty?
    FileUtils.rm_rf(destination = "#{@root}/current}")
    self.unzip_dir @last, destination
   end
  rescue
   raise 'Échec de la restauration du backup'
  end
 end
end