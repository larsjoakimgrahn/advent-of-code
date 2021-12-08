@data = File.readlines('input.txt').map { |l| l.split('|') }

@result = 0
@data.map do |line|
  numbers = line[0].split
  output = line[1].split

  @result += output.map { |o| o.length == 2 || o.length == 3 || o.length == 4 || o.length == 7 ? 1 : 0 }.inject { |a, b| a + b }
end

puts @result
