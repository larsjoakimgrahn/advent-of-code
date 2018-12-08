$data = File.readlines('input.txt')[0].split().map { |v| v.to_i }

$result = 0
def parse(children, metadata)
    Array.new(children).each { parse($data.shift, $data.shift) }
    $result += $data.shift(metadata).reduce(0, :+)
end

parse($data.shift, $data.shift)
puts $result