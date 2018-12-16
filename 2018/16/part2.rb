load 'operations.rb'
Sample = Struct.new(:registers_before, :opcode, :input1, :input2, :output, :registers_after)

samples = []

File.readlines('samples.txt').each_slice(3) do |before, sample, after|
    registers_before = before.delete('Before: ').delete('[').delete(']').split(',').map {|c| c.to_i}
    opcode, input1, input2, output = sample.split(' ').map {|c| c.to_i }
    registers_after = after.delete('After: ').delete('[').delete(']').split(',').map {|c| c.to_i}
    samples << Sample.new(registers_before, opcode, input1, input2, output, registers_after)
end

ops_to_tests = [:addr,:addi,:mulr,:muli,:banr,:bani,:borr,:bori,:setr,:seti,:gtir,:gtri,:gtrr,:eqir,:eqri,:eqrr]

possible_matches = {}

ops_to_tests.each do |op_to_test|
    samples.each do |sample|
        result = send(op_to_test, sample.registers_before, sample.input1, sample.input2, sample.output)
        if result == sample.registers_after
            possible_matches[op_to_test] ||= []
            possible_matches[op_to_test] << sample.opcode
        end
    end
end

opcodes = {}
while (opcodes.length != 16)
    value = possible_matches.select {|_,v| v.uniq.length == 1}
    if (value.length > 0)
        opcodes[value.first[0]] = value.first[1].uniq[0]
        possible_matches.each {|k,v| possible_matches[k] = v - [value.first[1].uniq[0]]}
        possible_matches.delete(value.first[0])
    end
end


opcodes = opcodes.invert

registers = [0,0,0,0]

File.readlines('program.txt').each do |line| 
    opcode, input1, input2, output = line.split(' ').map {|c| c.to_i }
    registers[output] = send(opcodes[opcode], registers, input1, input2, output)[output]
end
puts "value = #{registers[0]}"