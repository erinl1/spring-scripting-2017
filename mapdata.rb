require "csv"
ary = CSV.read("exampledata.csv")
#puts ary[1]
library = []
CSV.open("exampledata.csv", "wb") do |row|
  ary.each do |value|
    row = row
    puts value
  x = {}
  x.store(row.to_sym, value)
  puts x.inspect
  end
end
