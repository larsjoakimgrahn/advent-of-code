$serial_nbr = 7511

Point = Struct.new(:x,:y)

def power_level(rack_id, y)
    result = (((rack_id + 10) * y) + $serial_nbr) * (rack_id+10)
    return (result.to_s.split(//)[-3].to_i) - 5
end

$max_val = -9999999
$max_coord = ""
def set_max_val(x, y, power_level)
    new_val = [$max_val, power_level].max
    if ($max_val != new_val)
        $max_val = new_val
        $max_coord = "#{x},#{y}"
    end
end

$p_levels = {}
(1..300).each do |x|
    (1..300).each do |y|
        $p_levels[Point.new(x,y)] = power_level(x,y)
    end
end

def total_power_level(x,y, size)
    total = 0
    (0...size).each { |xs|
        (0...size).each { |ys|
            total += $p_levels[Point.new(x+xs,y+ys)]
        }
    }
    return total
end

(1..298).each do |x|
    (1..298).each do|y|
        set_max_val(x, y, total_power_level(x,y, 3))
    end
end

puts "#{$max_coord} = #{$max_val}"