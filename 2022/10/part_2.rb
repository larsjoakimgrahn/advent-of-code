Noop = Struct.new('Noop')
Addx = Struct.new('Addx', :value)

$input = File.readlines('input.txt').map{|line| line.gsub("\n", '')}
  .map{|line| line == "noop" ? Noop.new() : Addx.new(line.split(' ')[1].to_i) }

$cycle = 0 
$sprite_pos = 1

def draw()
  if $cycle % 40 == 0 then 
    puts ""
    $cycle = 0
  end 
  
  if [$cycle, $cycle - 1, $cycle + 1].include? $sprite_pos then 
    print "#"
  else 
    print " " 
  end
  $cycle += 1 
end

$input.each {|cmd| 
  if cmd.is_a? Noop then 
    draw()
  else 
    draw()
    draw()
    $sprite_pos += cmd.value
  end
}