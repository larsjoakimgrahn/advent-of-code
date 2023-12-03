$data = File.readlines('input.txt')

$numbers = Hash.new
$special_chars = Hash.new

class Fixnum
  def num_digits
    Math.log10(self).to_i + 1
  end
end

$data.each_with_index do |line, line_index|
  positions = line.enum_for(:scan, /\d+/).map { Regexp.last_match.begin(0) }
  values = line.scan(/\d+/).map {|s| s.to_i}
  
  $numbers[line_index] = Hash[positions.zip(values)]

  special_char_positions = line.enum_for(:scan, /[^a-zA-Z\.\d\s:]/).map { Regexp.last_match.begin(0) }
  special_char_values = line.scan(/[^a-zA-Z\.\d\s:]/)

  $special_chars[line_index] = Hash[special_char_positions.zip(special_char_values)]
end

total_sum = 0
$numbers.each do |digit_y, x_to_value|
  x_to_value.each do |digit_x, value|
    value_part_of_answer = false
    
    for y in (digit_y-1)..(digit_y+1)
      for x in (digit_x-1)..(digit_x+value.num_digits)
        if $special_chars[y] != nil 
          if $special_chars[y][x] != nil 
            value_part_of_answer = true
          end
        end
      end
   end
   if (value_part_of_answer == true) 
    total_sum += value
   end
  end  
end

p total_sum