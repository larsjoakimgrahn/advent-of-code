$data = File.readlines('input.txt')

$horizontal = 0
$depth = 0

$data.each do |line|
  move = line.split
  case move[0]
  when 'forward'
    $horizontal += move[1].to_i
  when 'down'
    $depth += move[1].to_i
  when 'up'
    $depth -= move[1].to_i
  else
    puts 'error'
  end
end

puts $horizontal * $depth
