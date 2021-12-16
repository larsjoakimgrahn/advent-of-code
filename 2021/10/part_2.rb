@data = File.readlines('input.txt').map(&:strip).map(&:chars)

@closers = {}
@closers['('] = ')'
@closers['['] = ']'
@closers['<'] = '>'
@closers['{'] = '}'

@openers = ['(', '<', '[', '{']

@points = {}
@points['('] = 1
@points['['] = 2
@points['<'] = 4
@points['{'] = 3

@values = []
@data.each do |line|
  value = 0
  last_opening = []
  syntax_error = false
  line.each do |cur|
    if @openers.include? cur
      last_opening.push(cur)
    else
      next if last_opening.empty?

      syntax_error = @closers[last_opening.last] != cur

      last_opening.pop unless syntax_error

      break if syntax_error
    end
  end
  next if syntax_error

  last_opening.reverse_each do |op|
    value = ((value * 5) + @points[op])
  end
  @values.push(value)
end

p @values.sort[@values.length / 2]
