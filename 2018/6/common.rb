BoundingBox=Struct.new(:min_x, :min_y, :max_x, :max_y)
Point=Struct.new(:x, :y)

def infinite?(point)
    [$x_range.begin,$x_range.end].include?(point.x) || [$y_range.begin,$y_range.end].include?(point.y)
end

def manhattan_distance(point1, point2)
    (point1.x - point2.x).abs + (point1.y - point2.y).abs
end

def find_boundaries(data)
    x_minmax = data.minmax_by { |point| point.x }
    y_minmax = data.minmax_by { |point| point.y }
    return BoundingBox.new(x_minmax[0].x, y_minmax[0].y, x_minmax[1].x, y_minmax[1].y)
end

input_data = File.readlines('input.txt')

$coords = input_data.map { |x| x.split(',') }.map { |val| Point.new(val[0].to_i, val[1].to_i) }
boundaries = find_boundaries( $coords )

$x_range = boundaries.min_x..boundaries.max_x
$y_range = boundaries.min_y..boundaries.max_y