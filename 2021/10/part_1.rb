@data = File.readlines('input.txt').map(&:strip).map(&:chars)

@closers = {}
@closers['('] = ')'
@closers['['] = ']'
@closers['<'] = '>'
@closers['{'] = '}'

@openers = ['(', '<', '[', '{']

@points = {}
@points[')'] = 3
@points[']'] = 57
@points['>'] = 25_137
@points['}'] = 1197

@counter = 0
@data.each do |line|
  last_opening = []
  line.each do |cur|
    if @openers.include? cur
      last_opening.push(cur)
    else
      next if last_opening.empty?

      syntax_error = @closers[last_opening.last] != cur

      last_opening.pop unless syntax_error

      if syntax_error
        @counter += @points[cur]
        break
      end

    end
  end
end

puts @counter
