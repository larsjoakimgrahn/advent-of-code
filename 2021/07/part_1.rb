@crabs = File.readlines('input.txt')[0].split(',').map(&:to_i)

@distances = Hash.new(0)

@crabs.length.times do |idx|
  @crabs.each do |crab|
    @distances[idx] += (crab - idx).abs
  end
end
p @distances.min_by { |_k, v| v }[1]
