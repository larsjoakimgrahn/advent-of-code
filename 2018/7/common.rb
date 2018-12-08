input_data = File.readlines('input.txt')

class Step
    attr_reader :dependent, :prerequisites
    attr_writer :dependent, :prerequisites

    def initialize(dependent, prerequisites, units_of_work=0)
        @dependent = dependent
        @prerequisites = prerequisites
        @units_of_work = units_of_work
    end
end

data = {}
input_data.map { |line| line.split(' ') }.each do |array|
    data[array[1]] ||= []
    data[array[1]] << array[7]
end

all_steps = (data.keys + data.values.flatten).uniq

prerequisites = {}
all_steps.each do |step|
    data[step]&.each do |dependent|
        prerequisites[dependent] ||= []
        prerequisites[dependent] << step
    end
end

alph_num = (('A'...'Z').zip(1...26)).to_h

$steps = {}
all_steps.each do |step|
    data[step] ||= []
    prerequisites[step] ||= []
    $steps[step] = Step.new(data[step], prerequisites[step], alph_num[step])
end