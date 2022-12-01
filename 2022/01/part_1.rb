$data = File.readlines('input.txt')

$prevDepth = 100_000_000
$count = 0

def count(depth)
  $count += 1 if depth > $prevDepth
  $prevDepth = depth
end

$elfs = Hash.new(0)
$elfcounter = 0
$data.each do |line|
  if line.strip.empty? then 
    $elfcounter += 1
  else
    $elfs[$elfcounter] += line.to_i
  end
end

puts $elfs.values.max