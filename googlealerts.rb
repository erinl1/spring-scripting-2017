require 'launchy'
#Launchy.open("https://www.google.com/alerts")
IO.popen("pbcopy", "w") { |pipe| pipe.puts "Nano Hacker Academy" }
