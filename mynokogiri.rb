require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open("https://my.pottermore.com"))
puts doc.css(".header__menu .link-text .innerText")
