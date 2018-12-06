load 'common.rb'

min_dist = {}
$x_range.each { |x|
    $y_range.each { |y|
        dist = 0
        grid_point = Point.new(x,y)
        $points.each { |point|
            dist += manhattan_distance(point, grid_point)
        }
        min_dist[grid_point] = dist
    }
}
puts min_dist.select { |k,v| v < 10000}.length