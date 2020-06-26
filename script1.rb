require "json"
file = File.open "data.json"
data = JSON.load file
some_data = data["security"]["sastScan"]["enabled"]
some_data
boom = "jagan"
boom
