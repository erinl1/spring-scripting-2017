require 'forecast_io'
  puts "latitude"
  lat = $stdin.gets.chomp
  puts "longitude"
  lon = $stdin.gets.chomp
  puts
  ForecastIO.api_key = '693e8ec10c739494aae2e683c7cc8e8a'
  forecast = ForecastIO.forecast(lat, lon)
  puts "coordinates: #{forecast.latitude}, #{forecast.longitude}"
  puts "summary: #{forecast.currently.summary}"
  puts "temperature: #{forecast.currently.temperature} F"
  puts "feel-like temperature: #{forecast.currently.apparentTemperature} F"
  puts "precipiation type: #{forecast.currently.precipType}"
  puts "precipiation probability: #{forecast.currently.precipProbability*100}%"
  puts "precipiation intensity: #{forecast.currently.precipIntensity*100}%"
  puts "cloud cover: #{forecast.currently.cloudCover*100}%"
  puts "wind speed: #{forecast.currently.windSpeed}"
  puts forecast.currently.icon
  #puts forecast.currently.time
