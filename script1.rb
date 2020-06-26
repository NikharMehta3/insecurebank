require "json"
file = File.open "data.json"
data = JSON.load file
some_data = data["security"]["sastScan"]["enabled"]
exit(some_data)
