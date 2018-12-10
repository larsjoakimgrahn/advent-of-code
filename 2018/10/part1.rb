data = File.readlines('input.txt')

$max_y = nil
$min_y = nil
$max_x = nil
$min_x = nil

def set_min_values(x, y)
    $max_y ||= y
    $min_y ||= y
    $max_x ||= x
    $min_x ||= x
    $max_y = [y, $max_y].max
    $min_y = [y, $min_y].min
    $max_x = [x, $max_x].max
    $min_x = [x, $min_x].min
end

class Star
    attr_reader :x, :y
    def initialize(position_x, position_y, velocity_x, velocity_y)
        @x = position_x
        @y = position_y
        @velocity_x = velocity_x
        @velocity_y = velocity_y
        set_min_values(@x, @y)
    end

    def move(iterations = 1)
        @x += (@velocity_x * iterations)
        @y += (@velocity_y * iterations)
        set_min_values(@x, @y)
    end
end

stars = []
data.each do |line|
    line.sub!('position=<', '')
    line.sub!('velocity=<', '')
    split_line = line.split('>')
    position = split_line[0].split(',').map {|c| c.to_i }
    velocity = split_line[1].split(',').map {|c| c.to_i }
    stars << Star.new(position[0], position[1], velocity[0], velocity[1])
end

iterations = 0
while (($max_y - $min_y) > 9) do
    iterations += 1
    $max_y = nil
    $min_y = nil
    $max_x = nil
    $min_x = nil
    stars.each { |star| star.move }
end
puts "Part2 = #{iterations}"
($min_y..$max_y).each do |y|
    row = ""
    ($min_x..$max_x).each { |x| row += stars.any? {|star| y == star.y && x == star.x } ? "#" : " " }
    puts "#{row}"
end