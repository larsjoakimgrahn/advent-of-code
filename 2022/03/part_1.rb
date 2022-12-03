$data = File.readlines('input.txt').map { |line| line.scan /\w/ }

puts $data.reduce(0) { |sum, rucksack|
  left,right = rucksack.each_slice( (rucksack.size/2.0).round ).to_a
  common = (left&right)[0]
  priority = common =~ /[[:upper:]]/ ? common.ord - 38 : common.ord - 96
  sum + priority
}
