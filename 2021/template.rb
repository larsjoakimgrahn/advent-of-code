#!/usr/bin/ruby

# Read file by Line
$data = File.readlines('input.txt')

# Static string data
# $data = %w[1 2 3 4 5 6]

# A method
def a_method(var1, var2 = 'Nobody')
  puts "HEJ! #{var1} AND #{var2}"
end

# Loop over lines
$data.each do |line|
  a_method(line)
end

# Read first line by word
$words = $data[0].split

$words.each do |word|
  #    puts word
end

# String to integer
# x.to_i
# For binary = x.to_i(base=2)
# For Hex = x.to_i(base=16)

# Loop over chunks of every n elements
# foo.each_slice(3).to_a
# => [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]

# Hash
# h = { foo: 'bar', hej: 'something', number: 7}
# h[:foo]
# h[:foo] = 'barbar'

# String manipulation
# myString = "Welcome to JavaScript!"
# myString["JavaScript"]= "Ruby"
#=> "Welcome to Ruby!"

# myString = "Welcome to JavaScript!"
# myString[10]= "Ruby"
# => "Welcome toRubyJavaScript!"

# myString = "Welcome to JavaScript!"
# myString[8..20]= "Ruby"
#=> "Welcome Ruby!"
