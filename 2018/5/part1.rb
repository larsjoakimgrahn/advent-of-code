$global_data = File.readlines('input.txt')[0].split(//)
$deleted = true
def react_with_adjacent_units()
    while ($deleted) do
        $deleted = false
        $global_data.each_with_index { |x, index|
            if ((index+1) == $global_data.length)
                next
            end
            if ($global_data[index] != $global_data[index+1] && $global_data[index].casecmp($global_data[index+1]) == 0)
                $deleted = true
                $global_data.delete_at(index+1)
                $global_data.delete_at(index)
            end
        }
    end
end

value = react_with_adjacent_units()
puts "Resulting Polymer: #{$global_data.join()}, len = #{$global_data.length}"