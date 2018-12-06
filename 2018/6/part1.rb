load 'common.rb'

grid_point_to_input_point_distance = {}

$x_range.each { |x|
    $y_range.each { |y|
        $points.each { |point|
            dist = manhattan_distance(point, Point.new(x,y))
            if (grid_point_to_input_point_distance[[x,y]] == nil)
                grid_point_to_input_point_distance[[x,y]] = {}
            end
            grid_point_to_input_point_distance[[x,y]][[point.x, point.y]] = dist
        }
    }
}

closest_points = []
infinite = []
grid_point_to_input_point_distance.each { |grid_point, point_list|
    min_point = nil
    min_dist = 999999
    point_list.each { |point, dist|
        if (dist < min_dist)
            min_dist = dist
            min_point = point
        elsif (dist == min_dist)
            min_point = nil
        end
    }
    if (grid_point[0] == $x_range.begin || grid_point[1] == $y_range.begin || grid_point[0] == $x_range.end || grid_point[1] == $y_range.end)
        infinite << min_point
        next
    end
    closest_points << min_point unless min_point == nil
}
freq = closest_points.select { |p| !infinite.include?(p) }.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.max_by { |_, v| v }
puts "freq = #{freq}"