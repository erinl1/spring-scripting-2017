require "csv"
ary = CSV.read("names.csv")
#puts ary.inspect
splitNames = ary.map do |row|
  split = row[0].split()
  newAry = "#{split[0]}, #{split[1]}"
end
CSV.open("new-file.csv","wb") do |csv|
  #inserts line of code
  splitNames.each do |i|
    csv << [i.split[0]]
    csv << [i.split[1]]
  end
end
