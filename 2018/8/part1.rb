$data = File.readlines('input.txt')[0].split().map { |v| v.to_i }

$result = 0
def parse(children, metadata)
    for _ in 0...(children) do
        parse($data.shift, $data.shift)
    end
    $result += $data.shift(metadata).reduce(0, :+)
end

parse($data.shift, $data.shift)
puts $result