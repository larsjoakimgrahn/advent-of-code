load 'common.rb'

min_dist = {}
$x_range.each do |x|
    $y_range.each do |y|
        min_dist[[x,y]] = $coords.sum { |coord| manhattan_distance(Point.new(x,y), coord) }
    end
end
puts min_dist.select { |_, dist| dist < 10000}.length