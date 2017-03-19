require "csv"
ary = CSV.read("header.csv")
#array = CSV.read("exampledata.csv")
library = []
#CSV.open("exampledata.csv", "wb") do |row|
#data_array = array.map do |value|
  ary.each do |key|
    data_array = array.map do |value|
  #  puts value
  puts key[0]

  x = {}
  #x.store(key.to_s, value)
  #puts x.inspect
  end
end
