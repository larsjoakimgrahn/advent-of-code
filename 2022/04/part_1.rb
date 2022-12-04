$data = File.readlines('input.txt')
  .map {|line| line.strip.split(',')}
  .map {|pair| pair
                  .map {|range| range.split('-').map{|v|v.to_i}}
                  .flat_map{|vv| vv[0]..vv[1]}}

puts $data.reduce(0) { |sum, pair|
  v = pair[0].cover?(pair[1]) || pair[1].cover?(pair[0]) ? 1 : 0
  sum + v 
}