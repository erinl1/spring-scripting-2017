require "csv"
ary = CSV.read("header.csv")
array = CSV.read("exampledata.csv")
#puts array.inspect
library = []
#CSV.open("exampledata.csv", "wb") do |row|
#data_array = array.map do |value|
array.each do |key|
  puts key[0]
  array[1].each do |value|
  #ary.each do |key|
  #  puts value[0].inspect
    #  puts value.inspect
    x = {}
    x.store(:hello, value)
    #puts x[:hello]
  end
end
