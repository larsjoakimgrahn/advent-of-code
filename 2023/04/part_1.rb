$data = File.readlines('input.txt')

$value = 0

$data.each do |line|
  game, row = line.split(':').map {|x| x.strip}
  solution_s, mine_s = row.split('|')
  solution = solution_s.split(' ').map {|x| x.to_i}
  mine = mine_s.split(' ').map {|x| x.to_i}
  if (solution & mine).size > 0
    $value += 2.pow((solution & mine).size-1)
  end
end

p $value