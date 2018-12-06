load 'common.rb'

min_dist = {}
$x_range.each do |x|
    $y_range.each do |y|
        dist = 0
        location = Point.new(x,y)
        $coords.each do |coord|
            dist += manhattan_distance(location, coord)
        end
        min_dist[location] = dist
    end
end
puts min_dist.select { |_, dist| dist < 10000}.length