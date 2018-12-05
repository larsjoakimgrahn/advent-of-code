load 'reaction.rb'
data = File.readlines('input.txt')[0].split(//)
puts react_with_adjacent_units(data)