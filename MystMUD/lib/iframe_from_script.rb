require 'json'

def iframe_from_script script
 "<!DOCTYPE html>
<html>
 <head>
  <script type=\"text/javascript\">
   document.script=#{script.to_json}
  </script>
 </head>
 <body>
 </body>
</html>"
end