input_data = File.readlines('input.txt')

Step = Struct.new(:dependent, :prerequisites)

data = {}
input_data.map { |line| line.split(' ') }.each do |array|
    data[array[1]] ||= []
    data[array[1]] << array[7]
end

all_steps = (data.keys + data.values.flatten).uniq

prerequisites = {}
all_steps.each do |step|
    if (data[step] != nil)
        data[step].each do |dependent|
            prerequisites[dependent] ||= []
            prerequisites[dependent] << step
        end
    end
end

$steps = {}
all_steps.each do |step|
    data[step] ||= []
    prerequisites[step] ||= []
    $steps[step] = Step.new(data[step], prerequisites[step])
end