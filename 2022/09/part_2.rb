Move = Struct.new('Move', :direction, :distance)
Point = Struct.new('Point', :x, :y)
Knot = Struct.new('Knot', :point, :visited_points, :child)

$input = File.readlines('input.txt').map{|line| line.gsub("\n", '')}
  .map{|line| Move.new(line.split(' ')[0], line.split(' ')[1].to_i) }

$knots = [Knot.new(Point.new(0,0), {[0,0]=>1}, nil)]
9.times {
  $knots.push(Knot.new(Point.new(0,0), {[0,0]=>1}, $knots.last))
}

def tail_position(head, tail)
  x_touching = tail.x == head.x || tail.x == (head.x - 1) || tail.x == (head.x + 1) 
  y_touching = tail.y == head.y || tail.y == (head.y - 1) || tail.y == (head.y + 1)
  if x_touching && y_touching then 
    return tail 
  elsif x_touching then 
    return Point.new(head.x, tail.y < head.y ? tail.y + 1 : tail.y - 1)
  elsif y_touching then 
    return Point.new(tail.x < head.x ? tail.x + 1 : tail.x - 1, head.y)
  else 
    return Point.new(tail.x < head.x ? tail.x + 1 : tail.x - 1,
                     tail.y < head.y ? tail.y + 1 : tail.y - 1)
  end
end

def execute_move(move, knot)
  return if (knot.child.nil?)
  knot.child.point = tail_position(knot.point, knot.child.point)
  knot.visited_points.store( [knot.point.x, knot.point.y], 1)
  knot.child.visited_points.store( [knot.child.point.x, knot.child.point.y], 1)
  execute_move(move, knot.child)
end

$input.each {|move| 
  knot = $knots.last
  move.distance.times {
    knot.point.x = knot.point.x + 1 if move.direction == "R" 
    knot.point.x = knot.point.x - 1 if move.direction == "L" 
    knot.point.y = knot.point.y - 1 if move.direction == "U" 
    knot.point.y = knot.point.y + 1 if move.direction == "D" 
  
    execute_move(move, knot)
  }
}

puts $knots.first.visited_points.size