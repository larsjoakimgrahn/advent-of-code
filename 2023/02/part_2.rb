$data = File.readlines('input.txt')

$values = Array.new

Grab = Struct.new(:color, :amount) 

p $data.map { |line|
  game, all_grabs = line.strip.split(':')
  grabs = all_grabs.strip.split(';')

  result = grabs.flat_map {|grab| 
    color_grabs = grab.strip.split(',')
    temp = color_grabs.map {|color_grab| 
      amount, color = color_grab.strip.split(' ')
      Grab.new(color, amount.to_i)
    }
  }
  max_vals = Hash['red' => 0,'green' => 0,'blue' => 0]
    result.each { |t|
      if t.amount > max_vals[t.color]
        max_vals[t.color] = t.amount
      end
    }
    max_vals.values.inject(:*)
  }.sum