load 'reaction.rb'
data = File.readlines('input.txt')[0].split(//)
value = react_with_adjacent_units(data)
puts value