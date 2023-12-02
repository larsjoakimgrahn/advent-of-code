$data = File.readlines('input.txt')

$values = Array.new

$data.each do |line|
  $values.push(line.scan(/\d/).values_at(0,-1).join('').to_i)
end

p $values.sum