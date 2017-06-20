require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'
doc = Nokogiri::HTML(open("https://www.urbanoutfitters.com/new-music-tech"))
logo_doc = Nokogiri::HTML(open('https://www.urbanoutfitters.com/?ref=logo'))
name = doc.css('span[itemprop ="name"]')
image = doc.css('span[itemprop ="image"]')
url = image.css('meta[itemprop ="url"]')
logo = logo_doc.css('img[alt = "Music + Tech"]')
puts logo = logo.attr("src")
text_array = []
img_array = []
logo_array = []
urban_hash = {}

puts name[0].text[13...-9]
0.upto(url.length-1) do |x|
  img_array.push(url[x]["content"])
end
2.upto(name.length-1) do |x|
  text = name[x].text[13...-9]
  text_array.push(text)
end
logo_array[0] = logo
urban_hash["logo"] = logo_array
urban_hash["text"] = text_array
urban_hash["img"] = img_array
json = urban_hash.to_json
File.open("urban.json", "a+") do |file|
  file.write("urbanoutfitters = #{json}")
end
