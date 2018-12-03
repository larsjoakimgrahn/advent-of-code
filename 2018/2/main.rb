#input = File.readlines('input.txt')
#
#@@char_arrays = input.map { |x| x.split(//) }
#@@char_arrays.each
#def almost_equals(arr)
#    @@char_arrays.each { |other_arr|
#        if arr.length != other_arr.length
#            next
#        end
#        result = []
#        arr.each_with_index {|item, index|
#            equals = item == other_arr[index]
#            result << equals
#        }
#        if (result.count(false) == 1)
#            s = ""
#            result.each_with_index {|item, index|
#                if item == true
#                    s += arr[index]
#                end
#            }
#            puts s
#            exit
#        end
#    }
#end
#
#@@char_arrays.each { |arr| almost_equals(arr) }

input = File.readlines('input.txt')

char_arrays = input.map { |x| x.split(//) }
def almost_equals(arr)
    hash = {}
    arr.each { |chars|
        chars.each_with_index { |dropped, index|
            newArr = chars.dup.tap{|i| i.delete_at(index)}
            s = newArr.join()
            if (hash.key?(s) && index == hash[s])
                puts s
                exit
            end
            hash[s] = index
        }
    }
end

almost_equals(char_arrays)