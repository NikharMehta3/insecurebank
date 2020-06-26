require "json"
file = File.open "data.json"
data = JSON.load file
STDOUT.puts data["security"]["sastScan"]["enabled"]
