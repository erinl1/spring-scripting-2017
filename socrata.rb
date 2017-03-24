require 'soda/client'
client = SODA::Client.new({:domain => "socrata", :app_token => "w4imPv49yhvBlkOUukeVAUZeD"})
response = client.get("644b-gaut", {"$limit" => 1, :namelast => "WINFREY", :namefirst => "OPRAH"})
puts response
