require "json"
file = File.open "data.json"
data = JSON.load file
data["security"]["sastScan"]["enabled"]
