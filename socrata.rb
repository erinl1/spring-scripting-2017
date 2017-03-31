require 'soda/client'
client = SODA::Client.new({domain: "data.cityofnewyork.us", app_token: "w4imPv49yhvBlkOUukeVAUZeD"})
response = client.get("feuq-due4")
puts response.first.keys
