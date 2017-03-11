require "json" # we need to add the package
require "csv"
File.open("filename.txt", "wb") do |file|
  file.write("a line of code\n")
  file.write("maybe another line\n")
end
event = {
  title: "NHA Hang Out!",
  date: "Saturday, March 11th",
  time: "1pm - 4pm",
  description: "You know where to sign up :)"
}

puts event.to_json
