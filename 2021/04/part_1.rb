Point = Struct.new(:x, :y, :value, :marked)
Board = Struct.new(:number, :lines) do
  def check(latest_number)
    lines.each do |l|
      return if l.empty?

      next unless l.all?(&:marked)

      puts lines.map { |l| l.select { |p| p.marked == false }.reduce(0) { |acc, p| acc + p.value } }.reduce(0) { |acc, v| acc + v } * latest_number
      exit 0
    end
    lines.transpose.each do |l|
      return if l.empty?

      next unless l.all?(&:marked)

      puts lines.map { |l| l.select { |p| p.marked == false }.reduce(0) { |acc, p| acc + p.value } }.reduce(0) { |acc, v| acc + v } * latest_number
      exit 0
    end
  end
end

$data = File.readlines('input.txt').map(&:strip)

$bingo_line = $data.delete_at(0).split(',').map(&:to_i)
$data.delete_at(1)

$boards = []

$data.each_slice(6).with_index do |lines, idx|
  lines.pop
  board = Board.new(
    idx,
    lines.each_with_index.map do |l, y|
      l.split.each_with_index.map do |p, x|
        Point.new(x, y, p.to_i, false)
      end
    end
  )
  $boards.push(board)
end

def mark_boards(number)
  $boards.each do |b|
    b.lines.each do |line|
      line.each do |point|
        point.marked = true if point.value == number
      end
    end
  end
end

$bingo_line.each do |number|
  puts number
  mark_boards(number)
  $boards.each { |b| b.check(number) }
end
