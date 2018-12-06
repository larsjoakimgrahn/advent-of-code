load 'common.rb'

min_dist = 0
$x_range.each do |x|
    $y_range.each do |y|
        min_dist += 1 unless $coords.sum { |coord| manhattan_distance(Point.new(x,y), coord) } >= 10000
    end
end
puts min_dist