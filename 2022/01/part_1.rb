$data = File.readlines('input.txt')

$elfs = Hash.new(0)
$elfcounter = 0

$data.each do |line|
  line.strip.empty? ? $elfcounter += 1 : $elfs[$elfcounter] += line.to_i
end

puts $elfs.values.max