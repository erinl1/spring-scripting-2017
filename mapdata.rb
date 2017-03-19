require "csv"
ary = CSV.read("header.csv")
array = CSV.read("exampledata.csv")
#puts array[0][0]
library = []
#CSV.open("exampledata.csv", "wb") do |row|
#data_array = array.map do |value|

  #ary.each do |value|
#puts value
x = {}
  (0..12).each do |index|
    key = array[0][index]
    x.store(key.to_sym, key)
    puts x
    #  puts value[i]
    end
    #puts x[:hello]
#puts data
