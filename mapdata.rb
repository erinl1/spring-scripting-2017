require "csv"
ary = CSV.read("header.csv")
array = CSV.read("exampledata.csv")
library = []
#CSV.open("exampledata.csv", "wb") do |row|
#data_array = array.map do |value|
array.each do |value|
  #ary.each do |key|
  #  puts value[0].inspect
    #  puts value
    x = {}
    x.store(:hello, value[0])
    puts x.inspect
#  end
end
