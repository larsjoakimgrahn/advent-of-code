@field = File.readlines('input.txt').map { |line| line.strip.chars.map(&:to_i) }

def adjacent(x, y)
  above = y == 0 ? 10 : (@field[y - 1] || [])[x]     || 10
  left =  x == 0 ? 10 : (@field[y]     || [])[x - 1] || 10
  right = (@field[y]     || [])[x + 1] || 10
  below = (@field[y + 1] || [])[x]     || 10

  result = {}
  result[[x, y - 1]] = above
  result[[x - 1, y]] = left
  result[[x + 1, y]] = right
  result[[x, y + 1]] = below
  result
end

@global_minimums = {}
@field.each_with_index do |line, y|
  line.each_with_index do |height, x|
    local_min = adjacent(x, y).values.min
    @global_minimums[[x, y]] = height if local_min > height
  end
end

@part_of_basin = @global_minimums
def find_basin(x, y, _value)
  for_evaluation = adjacent(x, y).select { |_k, v| v < 9 }.select { |k, _v| @part_of_basin[[k[0], k[1]]].nil? }

  return 1 if for_evaluation.empty?

  @part_of_basin = @part_of_basin.merge for_evaluation
  1 + for_evaluation.map { |k, v| find_basin(k[0], k[1], v) }.sum
end

@basins = {}
@global_minimums.each do |k, v|
  @basins[[k[0], k[1]]] = find_basin(k[0], k[1], v)
end
p @basins.values.sort.last(3).inject { |a, b| a * b }
