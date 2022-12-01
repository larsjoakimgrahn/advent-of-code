$data = File.readlines('input.txt')

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