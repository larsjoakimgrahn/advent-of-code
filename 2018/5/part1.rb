def react_with_adjacent_units(data)
    remainder = []
    while (data.length > 0) do
        if (data[-2] == nil); break end
        if (data[-1] != data[-2] && data[-1].casecmp(data[-2]) == 0)
            data.pop(2)
            data = data << remainder.pop() unless remainder[-1].nil?
            next
        end
        remainder << data.pop()
    end
    return data.length + remainder.length
end

data = File.readlines('input.txt')[0].split(//)
value = react_with_adjacent_units(data)
puts "Resulting Polymer: #{value}"