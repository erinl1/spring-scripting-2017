require "csv"
ary = CSV.read("names.csv")
#puts ary.inspect
CSV.open("new_names.csv","wb") do |csv|
  #inserts line of code
  splitNames = ary.map do |row|
    split = row[0].split()
    csv << [split[0]]
    csv << [split[1]]
  end
end
