$data = File.readlines('input.txt')

$point_table = Hash[
"A X" => 3,
"B X" => 1,
"C X" => 2,

"A Y" => 4,
"B Y" => 5,
"C Y" => 6,

"A Z" => 8,
"B Z" => 9,
"C Z" => 7
]

puts $data.reduce(0) { |sum, round| sum + $point_table[round.strip] }