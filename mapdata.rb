require "csv"
ary = CSV.read("header.csv")
array = CSV.read("exampledata.csv")
#puts array.inspect
library = []
#CSV.open("exampledata.csv", "wb") do |row|
#data_array = array.map do |value|
array[0].each do |key|
  puts key.inspect
  array[1].each do |value|
  #ary.each do |key|
  #  puts value[0].inspect
      puts value.inspect
    x = {}
    x.store(key.to_sym, value)
    #puts x.inspect
  end
end
