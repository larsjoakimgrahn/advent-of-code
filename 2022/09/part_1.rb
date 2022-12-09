Move = Struct.new('Move', :direction, :distance)
Point = Struct.new('Point', :x, :y)

$input = File.readlines('input.txt').map{|line| line.gsub("\n", '')}
  .map{|line| Move.new(line.split(' ')[0], line.split(' ')[1].to_i) }

$visited_points = {[0,0]=>1}
$head_position = Point.new(0,0)
$tail_position = Point.new(0,0)

def tail_position(head, tail)
  x_touching = tail.x == head.x || tail.x == (head.x - 1) || tail.x == (head.x + 1)
  y_touching = tail.y == head.y || tail.y == (head.y - 1) || tail.y == (head.y + 1)
  if x_touching && y_touching then 
    return tail 
  end
  if x_touching then 
    return Point.new(head.x, tail.y < head.y ? tail.y + 1 : tail.y - 1)
  elsif y_touching then 
    return Point.new(tail.x < head.x ? tail.x + 1 : tail.x - 1, head.y)
  end
end

def do_move(move) 
  move.distance.times {
    $head_position.x = $head_position.x + 1 if move.direction == "R"
    $head_position.x = $head_position.x - 1 if move.direction == "L" 
    $head_position.y = $head_position.y - 1 if move.direction == "U" 
    $head_position.y = $head_position.y + 1 if move.direction == "D" 
    
    $tail_position = tail_position($head_position, $tail_position)
    $visited_points.store([$tail_position.x, $tail_position.y], 1)
  }
end

$input.each {|move| do_move(move) }

puts $visited_points.size