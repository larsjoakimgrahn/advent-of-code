BoundingBox=Struct.new(:min_x, :min_y, :max_x, :max_y)
Point=Struct.new(:x, :y)

def manhattan_distance(point1, point2)
    (point1.x - point2.x).abs + (point1.y - point2.y).abs
end

def find_boundaries(data)
    min_x = data.min_by { |point| point.x }.x
    min_y = data.min_by { |point| point.y }.y
    max_x = data.max_by { |point| point.x }.x
    max_y = data.max_by { |point| point.y }.y
    return BoundingBox.new(min_x, min_y, max_x, max_y)
end

input_data = File.readlines('input.txt')

$points = input_data.map { |x| x.split(',') }.map { |val| Point.new(val[0].to_i, val[1].to_i) }
boundaries = find_boundaries( $points )

$x_range = boundaries.min_x..boundaries.max_x
$y_range = boundaries.min_y..boundaries.max_y