require "csv"
ary = CSV.read("array.csv")
#puts ary.inspect

newAry = ary.map do |row|
  puts row.inspect
  puts "011 - 1 - #{row[0]} - #{row[1]} - #{row[2]}"
end
[2,3,4,5].map do |i|
  i * 2
end
puts newAry.inspect
