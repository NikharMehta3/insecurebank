require "json"
file = File.open "result.json"
data = JSON.load file
ENV['SOME_VAR'] = 'test'
puts data["security"]["sastScan"]["enabled"]
