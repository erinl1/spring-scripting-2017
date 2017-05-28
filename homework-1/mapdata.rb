require "csv"
require "json"
sub_csv = CSV.read("subway.csv")
example_data = CSV.read("library.csv")
example = [[["gogsok":"sgfd"],["hello":"sdgg"]]]
opendata = []
lib_keys = []
library = []
example_data[0].each do |key|
  lib_keys.push(key)
end

my_array = []
(1..example_data.length-1).each do |row|
  my_obj = {}
  index = 0
  example_data[row].each do |value|
    if lib_keys[index]
      my_obj[lib_keys[index].to_sym] = value
    end
    index = index + 1
  end
  library.push(my_obj)
end


sub_keys = []
subway = []
sub_csv[0].each do |key|
  sub_keys.push(key)
end
my_array = []
(1..sub_csv.length-1).each do |row|
  my_obj = {}
  index = 0
  sub_csv[row].each do |value|
    if sub_keys[index]
      my_obj[sub_keys[index].to_sym] = value
    end
    index = index + 1
  end
  subway.push(my_obj)
end

opendata.push(subway)
opendata.push(library)
json = JSON.parse(opendata.to_json)
#puts json
json.each do |row|
  puts row
end
File.open("opendata.json", "wb") do |file|
  file.write(json)
end
