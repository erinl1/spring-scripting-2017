require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'
doc = Nokogiri::HTML(open("https://www.urbanoutfitters.com/new-music-tech"))
