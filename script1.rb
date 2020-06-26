require "json"
file = File.open "data.json"
data = JSON.load file
ENV['SOME_VAR'] = 'test'
puts data["security"]["sastScan"]["enabled"]
