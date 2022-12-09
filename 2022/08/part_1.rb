require 'matrix'
require 'colorize'

$input_array = File.readlines('input.txt').map{|line| line.gsub("\n", '')}.map { |line| line.scan /\w/ }.map {|line| line.map {|i| i.to_i}}

$tree_matrix = Matrix[*$input_array]

$visible_trees = []

$tree_matrix.each_with_index { |value, row, col|
  if row == 0 || col == 0 || row == $tree_matrix.row_count-1 || col == $tree_matrix.column_count-1 then 
    $visible_trees.push([row,col])
  else 
  column_vector = $tree_matrix.column(col).to_a
  row_vector = $tree_matrix.row(row).to_a

  above = column_vector.slice(0,row).max.to_i
  below = column_vector.slice(row+1,100).max.to_i
  left = row_vector.slice(0,col).max.to_i
  right = row_vector.slice(col+1,100).max.to_i
  
  min_surrounding_value = [above, below, left, right].min
  visible = min_surrounding_value < value

  $visible_trees.push([row,col]) unless !visible
  end
}

def print_tree()
  current_row = 0
  $tree_matrix.each_with_index {|value, row, col| 
  if current_row != row then
    puts ""
    current_row = row 
  end
    exists = $visible_trees.include?([row, col])
    print "#{value} " unless exists 
    print "#{value.to_s.red} " if exists
  }
  puts ""
end 

print_tree()
puts $visible_trees.length