@field = File.readlines('input.txt').map { |line| line.strip.chars.map(&:to_i) }
def min_adjacent(x, y)
  above = y == 0 ? 10 : (@field[y - 1] || [])[x]     || 10
  left =  x == 0 ? 10 : (@field[y]     || [])[x - 1] || 10
  right = (@field[y]     || [])[x + 1] || 10
  below = (@field[y + 1] || [])[x]     || 10
  puts "above #{above} left #{left}, right #{right}, below #{below}" if (x == 0) && (y == 0)
  [above, left, right, below].min
end

global_minimums = {}
@field.each_with_index do |line, y|
  line.each_with_index do |height, x|
    local_min = min_adjacent(x, y)

    global_minimums[[x, y]] = height if local_min > height
  end
end
p global_minimums.values.map { |i| i + 1 }.sum
