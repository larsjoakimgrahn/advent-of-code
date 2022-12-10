Noop = Struct.new('Noop')
Addx = Struct.new('Addx', :value)

$input = File.readlines('input.txt').map{|line| line.gsub("\n", '')}
  .map{|line| line == "noop" ? Noop.new() : Addx.new(line.split(' ')[1].to_i) }

$cycles = [1]
$input.each {|cmd| 
  if cmd.is_a? Noop then 
    $cycles.push($cycles.last)
  else 
    $cycles.push($cycles.last)
    $cycles.push($cycles.last + cmd.value)
  end
}
puts $cycles[19] * 20 + $cycles[59] * 60 + $cycles[99] * 100 + $cycles[139] * 140 + $cycles[179] * 180 + $cycles[219] * 220