$data = File.readlines('input.txt')

$seed_values = [432986705, 28073546, 1364097901, 88338513, 2733524843, 234912494, 3151642679, 224376393, 485709676, 344068331, 1560394266, 911616092, 3819746175, 87998136, 892394515, 435690182, 4218056486, 23868437, 848725444, 8940450]

$lookup = Hash.new

$result = []
$data.each do |line|
  if line.strip.end_with?(':')
    $result.push($lookup) unless $lookup.empty?
    $lookup = Hash.new
  end

  next if line.strip.empty? || line.strip.end_with?(':')

  destination, range_start, range_length = line.strip.split(' ').map{|v| v.to_i}

  for x in range_start..(range_start + range_length-1)
    $lookup[x] = destination + x - range_start
  end
end
$vals = []
$seed_values.each {|seed|
  val = seed
  $result.each {|lookup| val = lookup[val] || val }
  $vals.push(val)
}
p $vals.min
