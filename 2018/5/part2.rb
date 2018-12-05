input_data = File.readlines('input.txt')[0]
$global_data = []
alphabet = ('a'..'z').to_a

def react_with_adjacent_units()
    deleted = true
    while (deleted) do
        deleted = false
        $global_data.each_with_index { |x, index|
            if ((index+1) == $global_data.length)
                next
            end
            if ($global_data[index] != $global_data[index+1] && $global_data[index].casecmp($global_data[index+1]) == 0)
                deleted = true
                $global_data.delete_at(index+1)
                $global_data.delete_at(index)
            end
        }
    end
end

results = {}
alphabet.each { |letter|
    $global_data = input_data.delete(letter).delete(letter.upcase()).split(//)
    value = react_with_adjacent_units()
    results[letter] = $global_data.length
}
puts results.min_by { |k,v| v }