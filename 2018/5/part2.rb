input_data = File.readlines('input.txt')[0]
alphabet = ('a'..'z').to_a

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

results = {}
alphabet.each { |letter|
    data = input_data.delete(letter).delete(letter.upcase()).split(//)
    value = react_with_adjacent_units(data)
    results[letter] = value
}
puts results.min_by { |k,v| v }