require 'set'

$data = File.readlines('input.txt')
  .map {|line| line.strip.split(',')}
  .map {|pair| pair
                  .map {|range| range.split('-').map{|v|v.to_i}}
                  .flat_map{|vv| vv[0]..vv[1]}}

puts $data.reduce(0) { |sum, pair|
  overlaps = (pair[0].to_set & pair[1].to_set).size > 0
  sum + (overlaps ? 1 : 0)
}