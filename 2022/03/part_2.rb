$data = File.readlines('input.txt').map { |line| line.scan /\w/ }
  .each_slice(3).to_a

puts $data.reduce(0) { |sum, group|
  common = (group[0]&group[1]&group[2])[0]
  priority = common =~ /[[:upper:]]/ ? common.ord - 38 : common.ord - 96
  sum + priority
}