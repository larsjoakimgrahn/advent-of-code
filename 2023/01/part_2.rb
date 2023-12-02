$data = File.readlines('input.txt')

$values = Array.new

$numberise = Hash['one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9']

$data.each do |line|
  $values.push(line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).values_at(0,-1).map{|v| $numberise[v[0]] || v[0] }.join('').to_i)
end

p $values.sum