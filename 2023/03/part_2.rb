$data = File.readlines('input.txt')

$numbers = Hash.new
$gears = Hash.new

class Fixnum
  def num_digits
    Math.log10(self).to_i + 1
  end
end

$data.each_with_index do |line, line_index|
  positions = line.enum_for(:scan, /\d+/).map { Regexp.last_match.begin(0) }
  values = line.scan(/\d+/).map {|s| s.to_i}
  
  $numbers[line_index] = Hash[positions.zip(values)]

  gear_positions = line.enum_for(:scan, /\*/).map { Regexp.last_match.begin(0) }
  gear_values = line.scan(/\*/)

  $gears[line_index] = Hash[gear_positions.zip(gear_values)]
end

$gears_to_adjacent_numbers = Hash.new

$numbers.each do |digit_y, x_to_value|
  x_to_value.each do |digit_x, value|
    
    for y in (digit_y-1)..(digit_y+1)
      for x in (digit_x-1)..(digit_x+value.num_digits)
        if $gears[y] != nil 
          if $gears[y][x] != nil 
            if $gears_to_adjacent_numbers["#{x},#{y}"] == nil 
              $gears_to_adjacent_numbers["#{x},#{y}"] = [value]
            else
              $gears_to_adjacent_numbers["#{x},#{y}"].push(value)
            end
          end
        end
      end
   end
  end  
end

$res = 0
$gears_to_adjacent_numbers.each do |key, value| 
  if (value.size == 2)
    $res += value[0] * value[1]
  end
end
p $res