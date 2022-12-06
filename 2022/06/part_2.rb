require 'set'
$input = File.readlines('input.txt')[0]

$input.chars.each_cons(14) { |chars|
  if chars.to_set.length == chars.length then
    puts "#{chars.join} at #{$input.index(chars.join) + 14}"
    exit
  end
}