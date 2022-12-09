require 'matrix'
require 'colorize'

$input_array = File.readlines('input.txt').map{|line| line.gsub("\n", '')}.map { |line| line.scan /\w/ }.map {|line| line.map {|i| i.to_i}}

$tree_matrix = Matrix[*$input_array]

$visible_trees = {}

$tree_matrix.each_with_index { |value, row, col|
  column_vector = $tree_matrix.column(col).to_a
  row_vector = $tree_matrix.row(row).to_a

  above = column_vector.slice(0,row).reverse.find_index {|t| t >= value}
  below = column_vector.slice(row+1,100).find_index {|t| t >= value}
  left = row_vector.slice(0,col).reverse.find_index {|t| t >= value}
  right = row_vector.slice(col+1,100).find_index {|t| t >= value}
  
  if above.is_a? Integer 
    above = above + 1
  else 
    above = column_vector.slice(0,row).size
  end
  if below.is_a? Integer
    below = below + 1
  else 
    below = column_vector.slice(row+1,200).size
  end
  if left.is_a? Integer
    left = left + 1
  else
    left = row_vector.slice(0,col).size
  end
  if right.is_a? Integer
    right = right + 1
  else 
    right = row_vector.slice(col+1,200).size  
  end
  
  visible = above * below * left * right
  
  $visible_trees[[row,col]] = visible

}

pp $visible_trees.max_by {|k,v| v}