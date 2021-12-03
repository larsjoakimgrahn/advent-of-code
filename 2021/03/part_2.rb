$data = File.readlines('input.txt')

$parsed_data = $data.map { |line| line.strip.chars.map(&:to_i) }

def rotate_matrix(m)
  m.transpose.map(&:reverse)
end

def doit(arr, comparator, index)
  return arr[0] if arr.length == 1

  rotated_matrix = rotate_matrix(arr)
  digit = comparator.call(rotated_matrix.map(&:sum)[index], (arr.length / 2.0))

  doit(arr.select { |x| x[index] == digit.to_i }, comparator, index + 1)
end

$oxygen = doit($parsed_data, ->(x, y) { x >= y ? '1' : '0' }, 0)

$co_two = doit($parsed_data, ->(x, y) { x < y ? '1' : '0' }, 0)

puts $oxygen.join.to_i(2) * $co_two.join.to_i(2)
