$data = File.readlines('input.txt')
def gamma(arr)
  arr.map { |s| s > ($data.length / 2) ? '1' : '0' }.reduce('') { |sum, num| sum + num }.to_i(2)
end

def epsilon(arr)
  arr.map { |s| s < ($data.length / 2) ? '1' : '0' }.reduce('') { |sum, num| sum + num }.to_i(2)
end

$parsed_data = $data.map { |line| line.strip.chars.map(&:to_i) }

$rotated_matrix = $parsed_data.transpose.map(&:reverse)

$summed = $rotated_matrix.map(&:sum)
puts gamma($summed) * epsilon($summed)
