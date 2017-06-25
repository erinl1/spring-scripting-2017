require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'
require 'launchy'
puts "search bar for google alerts:"
input = STDIN.gets.chomp
link = "https://www.google.com/alerts/preview?params=%5Bnull%2C%5Bnull%2Cnull%2Cnull%2C%5Bnull%2C%22#{input}%22%2C%22com%22%2C%5Bnull%2C%22en%22%2C%22US%22%5D%2Cnull%2Cnull%2Cnull%2C0%2C1%5D%2Cnull%2C3%2C%5B%5Bnull%2C1%2C%22erin.lee.ny%40gmail.com%22%2C%5Bnull%2Cnull%2C3%5D%2C2%2C%22en-US%22%2Cnull%2Cnull%2Cnull%2Cnull%2Cnull%2C%220%22%2Cnull%2Cnull%2C%22AB2Xq4hcilCERh73EFWJVHXx-io2lhh1EhC8UD8%22%5D%5D%5D%2C0%5D"
doc = Nokogiri::HTML(open(link))
block = doc.css('li[class ="result"]')
title = block.css("a.result_title_link")
title = block.css("a.result_title_link")
blurb = block.css("span[class = 'snippet']")
web_array = []
0.upto(block.length-1) do |x|
  web_title = title[x].content
  web_link = title[x]["href"]
  web_blurb = blurb[x].content
  web_array[x] = {title: web_title, link: web_link, blurb: web_blurb}
end
File.delete("galert.json")
File.open("galert.json", "a+") do |file|
  file.write("google_json = #{web_array.to_json}")
end
Launchy::Browser.run("/Users/erinlee/Desktop/nano-hacker-academy/spring-scripting-2017/googlealert.html")
