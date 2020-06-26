#!/usr/bin/env ruby
require "json"
file = File.open "data.json"
data = JSON.load file
puts data["security"]["sastScan"]["enabled"]
