load 'reaction.rb'

input_data = File.readlines('input.txt')[0]
alphabet = ('a'..'z').to_a

results = {}
alphabet.each { |letter|
    data = input_data.delete(letter).delete(letter.upcase()).split(//)
    value = react_with_adjacent_units(data)
    results[letter] = value
}
puts results.min_by { |k,v| v }