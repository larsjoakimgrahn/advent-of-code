load 'operations.rb'
Sample = Struct.new(:id, :registers_before, :opcode, :input1, :input2, :output, :registers_after)

samples = []
id = 0
File.readlines('samples.txt').each_slice(3) do |before, op, after|
    registers_before = before.delete('Before: ').delete('[').delete(']').split(',').map {|c| c.to_i}
    opcode, input1, input2, output = op.split(' ').map {|c| c.to_i }
    registers_after = after.delete('After: ').delete('[').delete(']').split(',').map {|c| c.to_i}
    id += 1
    samples << Sample.new(id, registers_before, opcode, input1, input2, output, registers_after)
end

inst_count = {}
[:addr,:addi,:mulr,:muli,:banr,:bani,:borr,:bori,:setr,:seti,:gtir,:gtri,:gtrr,:eqir,:eqri,:eqrr].each do |op_to_test|
    samples.each do |sample|
        result = send(op_to_test, sample.registers_before, sample.input1, sample.input2, sample.output)
        inst_count[sample.id] ||= []
        if result == sample.registers_after
            inst_count[sample.id] << op_to_test
        end
    end
end

puts inst_count.select {|key,value| value.length >= 3}.length