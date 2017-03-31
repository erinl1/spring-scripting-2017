require "google_drive"
require 'soda/client'
client = SODA::Client.new({domain: "data.cityofnewyork.us", app_token: "w4imPv49yhvBlkOUukeVAUZeD"})
response = client.get("feuq-due4")
puts response[0].values.inspect

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
session = GoogleDrive::Session.from_config("config.json")

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
ws = session.spreadsheet_by_key("1tOatwbeCtqw67v7dE1s-FjE7SOJQ-qxthn04nMnauFY").worksheets[0]

# Gets content of A2 cell.
p ws[1, 1]  = "NY OPENDATA LIBRARIES"#==> "hoge"

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
(1..response.first.keys.length).each do |param|
  ws[2,param+1] = response.first.keys[param-1]
end
(0..response.length-1).each do |i|
    array = response[i].values
    (0..array.length).each do |data|
    ws[i+3, data+2] = array[data]
end
end
(0..300).each do |me|
  ws[1,me+1] = " "
end

ws.save
# Dumps all cells.
(1..ws.num_rows).each do |row|
  (1..ws.num_cols).each do |col|
    p ws[row, col]
  end
end

# Yet another way to do so.
p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

# Reloads the worksheet to get changes by other clients.
ws.reload
