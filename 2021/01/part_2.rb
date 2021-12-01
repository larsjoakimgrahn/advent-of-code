$data = File.readlines('input.txt')

$prevDepth = 100_000_000
$count = 0

def count(depth)
  $count += 1 if depth > $prevDepth
  $prevDepth = depth
end

$data.each_cons(3) do |line|
  newDepth = line[0].to_i + line[1].to_i + line[2].to_i
  count(newDepth)
end

puts $count
