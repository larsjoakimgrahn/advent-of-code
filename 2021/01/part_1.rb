$data = File.readlines('input.txt')

$prevDepth = 100_000_000
$count = 0

def count(depth)
  $count += 1 if depth > $prevDepth
  $prevDepth = depth
end

$data.each do |line|
  newDepth = line.to_i
  count(newDepth)
end

puts $count
