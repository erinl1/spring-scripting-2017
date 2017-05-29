require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'
doc = Nokogiri::HTML(open("https://www.urbanoutfitters.com/new-music-tech"))
title = doc.css('span[itemprop ="name"]')
hash = []
[0..title.length-1].each do |x|
  row = title[x].text[13...-9]
  hash.push(row)#puts row
#  puts hash[:item][x]
  #puts hash[:item][x].inspect
end
  json = JSON.parse(hash.to_json)
  puts json
  json.each do |row|
    puts row
  end
  File.open("tech.json", "wb") do |file|
    file.write(json)
  end