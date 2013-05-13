# fonctions permettant d'afficher des erreurs

module Error
 NOT_FOUND = "<!doctype html>
<html>
 <head>
  <title>404 - Not Found</title>
 </head>
 <body>
  <h1>404 - Not Found</h1>
 </body>
</html>"

 def self.olc_class
  echo :top_show, "<br><p>Seules les classes suivantes sont disponibles dans l'\
OLC :</p><p>#{OLC.keys.collect(&:to_s).join ', '}</p>"
 end

 def self.cmd_unavailable
  wiz 'Commande indisponible'
 end
	
 def self.cmd_hack c # command name used
  $hack << "<u>#{Time.now}:</u> <b>#{$p}</b> uses <b>#{c}</b> via scripting."
  $g.each do |guest|
   if guest.h and guest.h == $p
    guest.eject "Scripting interdit et enregistré! \
Merci d'utiliser la commande \"pray\" en cas de problème"
    return
   end
  end
 end

 def self.warning s
  print "\n\n#{s} :\n#{$!}\n\n"
 end

 def self.report *report_methods
  if report_methods.empty?
   report_methods << 'stderr' << 'log'
  end
  message = "from #{($@.reverse[0..-2]).join(":\nfrom ")}
from #{$@[0]}:\n\t#{$!} (#{$!.class})"
  report_methods.each do |method|
   case method
   when 'stderr'
    STDERR << "\n#{message}\n"
   when 'wiz'
    wiz CGI.escapeHTML(message).
     gsub("\n", '<br>').
     gsub("\t", '&nbsp; &nbsp; &nbsp; ')
   when 'light wiz'
    wiz CGI.escapeHTML(message.split("\n")[-3..-1].join "\n").
     gsub("\n", '<br>').
     gsub("\t", '&nbsp; &nbsp; &nbsp; ')
   when 'log'
    nil
   when 'html'
    print "<div style=position:fixed;top:0px;left:0px;\
background-color:white;color:black><pre>\
Internal Server Error - 500

#{CGI.escapeHTML message.split("\n")[2..-1].join "\n"}</pre></div>"
   end
  end
 end
end