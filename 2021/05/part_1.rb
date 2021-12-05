Path = Struct.new(:point1, :point2)
Point = Struct.new(:x, :y, :score)

$data = File.readlines('input.txt').map(&:split).map do |d|
  first = d[0].split(',').map(&:to_i)
  second = d[2].split(',').map(&:to_i)
  Path.new(
    Point.new(first[0], first[1], 0),
    Point.new(second[0], second[1], 0)
  )
end

$board = {}
$data.each do |path|
  next if path.point1.x != path.point2.x && path.point1.y != path.point2.y

  x = path.point1.x
  y = path.point1.y

  move = path.point1.x < path.point2.x ? -> { x += 1 } : -> { x -= 1 }
  while x != path.point2.x
    $board[[x, y]] = Point.new(x, y, 0) if $board[[x, y]].nil?
    $board[[x, y]].score += 1
    move.call
    $board[[x, y]] = Point.new(x, y, 0) if x == path.point2.x && $board[[x, y]].nil?
    $board[[x, y]].score += 1 if x == path.point2.x
  end

  move = path.point1.y < path.point2.y ? -> { y += 1 } : -> { y -= 1 }
  while y != path.point2.y
    $board[[x, y]] = Point.new(x, y, 0) if $board[[x, y]].nil?
    $board[[x, y]].score += 1
    move.call
    $board[[x, y]] = Point.new(x, y, 0) if y == path.point2.y && $board[[x, y]].nil?
    $board[[x, y]].score += 1 if y == path.point2.y
  end
end

## Print board
# width = $board.max_by { |_k, v| v.x }[1].x
# height = $board.max_by { |_k, v| v.y }[1].y
# (0..height).each do |y|
#  (0..width).each do |x|
#    print '.' if $board[[x, y]].nil?
#    print $board[[x, y]].score if $board[[x, y]] != nil
#  end
#  puts ''
# end

p $board.select { |_k, v| v.score > 1 }.count
