$data = File.readlines('input.txt')

$point_table = Hash[
"A X" => 4,
"B X" => 1,
"C X" => 7,

"A Y" => 8,
"B Y" => 5,
"C Y" => 2,

"A Z" => 3,
"B Z" => 9,
"C Z" => 6
]

puts $data.reduce(0) { |sum, round| sum + $point_table[round.strip] }