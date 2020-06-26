require "json"
file = File.open "data.json"
data = JSON.load file
puts "result:", data["security"]["sastScan"]["enabled"]
