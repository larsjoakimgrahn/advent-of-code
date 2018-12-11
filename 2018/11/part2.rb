$serial_nbr = 7511

Point = Struct.new(:x,:y)

def power_level(rack_id, y)
    result = (((rack_id + 10) * y) + $serial_nbr) * (rack_id+10)
    return (result.to_s.split(//)[-3].to_i) - 5
end

$max_val = -9999999
$max_coord = ""
$max_size = 0
def set_max_val(x, y, power_level, size)
    new_val = [$max_val, power_level].max
    if ($max_val != new_val)
        $max_val = new_val
        $max_coord = "#{x},#{y}"
        $max_size = size
    end
end

$p_levels = {}
(1..300).each do |x|
    (1..300).each do |y|
        $p_levels[Point.new(x,y)] = power_level(x,y)
    end
end

def total_power_level(x, y, size)
    total = 0
    (x...(x+size)).each do |xs|
        (y...(y+size)).each do |ys|
            total += $p_levels[Point.new(xs, ys)]
        end
    end
    return total
end

# Finishes before this
(2..20).each do |size|
    puts "size = #{size}, #{$max_coord},#{$max_size} (max = #{$max_val})"
    (1..(300-(size-1))).each do |x|
        (1..(300-(size-1))).each do |y|
            set_max_val(x, y, total_power_level(x, y, size), size)
        end
    end
end

puts "#{$max_coord} = #{$max_val} size = #{$max_size}"