require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'
doc = Nokogiri::HTML(open("https://www.urbanoutfitters.com/new-music-tech"))
name = doc.css('span[itemprop ="name"]')
image = doc.css('span[itemprop ="image"]')
url = image.css('meta[itemprop ="url"]')
text_array = []
img_array = []
urban_hash = {}
puts name[0].text[13...-9]
0.upto(url.length-1) do |x|
  img_array.push(url[x]["content"])
end
2.upto(name.length-1) do |x|
  text = name[x].text[13...-9]
  text_array.push(text)
end
urban_hash["text"] = text_array
urban_hash["img"] = img_array
json = urban_hash.to_json
File.open("urban.json", "a+") do |file|
  file.write("urbanoutfitters = #{json}")
end
