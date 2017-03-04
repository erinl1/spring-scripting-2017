require "csv"
ary = CSV.read("array.csv")
puts ary.inspect
item = ARGV.first
puts "Hello #{item}"
puts "Hello"
nickname = "erin"
name = "Erin Lee"
firstname = "Erin"
lastname = "Lee"
firstname = "Erin"
puts name, nickname, firstname, lastname
#combine strings
puts "starin' at #{firstname}"
#changing variables
firstname = "ERIN"
puts firstname
puts 1
puts 2
puts 1 + 2
puts 1*2
puts 1-2
#to get fraction/decimal, add point and 0
puts 3/2.0
#TYPECASTING
#string to integer
puts "3".to_i
#integer to string
puts 3.to_s
monster = {
  "name" => "monster"
}

ary.each do |row|
  puts
end
