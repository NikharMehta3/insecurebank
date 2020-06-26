require "json"
file = File.open "data.json"
data = JSON.load file
print "result:", data["security"]["sastScan"]["enabled"]
puts
