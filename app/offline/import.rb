#!/usr/bin/ruby -w
require 'csv'

data_file = "../../data/Users.csv"

csv_text = File.read(data_file)
csv = CSV.parse(csv_text, :headers => true)

csv.delete_if { |row| row['name'].nil? || row['name'].empty?  }

csv.each() do |row|
	puts row['name']
end
