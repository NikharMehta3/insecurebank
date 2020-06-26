require "json"
file = File.open "data.json"
data = JSON.load file
ENV['SOME_VAR'] = 'test'
data["security"]["sastScan"]["enabled"]
