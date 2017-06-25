require "Faker"
require "CSV"
#puts Faker::Name.name

CSV.open("fakerlife.csv","wb") do |csv|
  array = Faker::Name.name.split()
  email = Faker::Internet.email
  number = Faker::PhoneNumber.phone_number
  lat =  Faker::Address.latitude
  lon = Faker::Address.longitude
  puts array
  if array.length == 2
  csv << [array[0], array[1], email, number, lat, lon]
  elsif array[0] == "Ms." || array[0] == "Mr."
    csv << ["#{array[0]} #{array[1]}", array[2], email, number, lat, lon]
  else
    csv << [array[0], "#{array[1]} #{array[2]}", email, number, lat, lon]
  end
end
