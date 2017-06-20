require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'
doc = Nokogiri::HTML(open('https://www.nytimes.com/section/technology?WT.nav=page&action=click&contentCollection=Tech&module=HPMiniNav&pgtype=Homepage&region=TopBar'))
trending =  doc.css("ol[class = 'story-menu']")
headline = trending.css("div[class = 'story-body']")
puts headline[0]
img = trending.css("img")
ny_times = {}
trend = []
#puts headline[3].text[29...-25]
0.upto(headline.length-1) do |x|
  "trending_#{x}" = Hash.new
  "trending_#{x}"["text"] = headline[x].css("h2[class = 'headline']")
  trend.push("trending_#{x}")
end

puts trend
ny_times["trend"] = trend
#ny_times.to_json
