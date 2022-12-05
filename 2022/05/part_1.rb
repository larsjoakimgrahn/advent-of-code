Instruction = Struct.new('Instruction', :number, :from, :to)

$input = File.readlines('input.txt')

$crates = $input
  .first(8)
  .map {|line| line.gsub("\n",'') }
  .map {|line| line.scan /.{1,4}/ }
  .map {|line| line.map { |chars| chars.gsub('[','')}}
  .map {|line| line.map { |chars| chars.gsub(']','')}}
  .map {|line| line.map { |chars| chars.strip}}
  .transpose
  .map {|column| column.reject {|c| c.empty?}}

$instructions = File.readlines('input.txt')
  .map {|line| line.gsub("\n",'') }
  .last(502)
  .map {|l| l.split(' ')}
  .map {|l| Instruction.new(l[1].to_i, l[3].to_i-1, l[5].to_i-1)}

$instructions.each { |instruction|
  instruction.number.times {
    crate = $crates[instruction.from].shift
    $crates[instruction.to].unshift(crate)
  }
}
puts $crates.reduce("") {|result, column| result += column[0]}