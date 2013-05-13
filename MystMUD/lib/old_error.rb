class Error
 unless defined? DEFAULT_REPORT
  DEFAULT_REPORT = ['html']
 end
 unless defined? ALWAYS_REPORT
  ALWAYS_REPORT = ['log', 'stderr']
 end
 
 NOT_FOUND = "<!DOCTYPE html>
<html>
 <head>
  <meta charset=UTF-8>
  <title>404 - Not Found</title>
 </head>
 <body>
  <h1>404 - Not Found</h1>
 </body>
</html>"
 
 def self.html_message div = true
  "<meta charset=UTF-8>
#{"<div style=\"position:fixed;top:0px;left:0px;border:2px solid black;\
background-color: white; color:black; padding:25px\">" if div}<pre>\
Erreur : (#{$!.class}) | <a href=\"javascript:history.back()\">page précédente</a>

#{CGI.escapeHTML $!.message}

#{CGI.escapeHTML "#{'from' unless $@.size == 2} \
#{($@[0..-3]).join(":\nfrom ")}"}</pre>#{'</div>' if div}"
 end
 
 def self.message
  "from #{($@.reverse[0..-2]).join(":\nfrom ")}
from #{$@[0]}:\n\t#{$!} (#{$!.class})"
 end

 def self.report *report_methods
  if report_methods.empty?
   report_methods = DEFAULT_REPORT
  end
  report_methods += ALWAYS_REPORT
  unless report_methods.empty?
   @@log = "errors/#{report_methods[0]}"
   report_methods.each do |method|
    if respond_to?(method = "report_#{method}")
     send method
    end
   end
  end
 end
 
 def self.report_html
  print html_message
 end
 
 def self.report_log
  Logger.write @@log, "#{Logger.time} #{message}\n\n"
 end
 
 def self.report_stderr
  STDERR << "\n#{message}\n"
 end
end