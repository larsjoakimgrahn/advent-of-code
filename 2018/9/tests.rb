require 'colorize'

load 'marbles.rb'

def test(players, last_marble, expected)
    test_result = high_score(players, last_marble)
    if (test_result == expected)
        puts "PASSED test (#{players},#{last_marble})".green
    else
        puts "FAILED test (#{players},#{last_marble}), expected: #{expected} got #{test_result}".red
    end
end

test(9, 25, 32)
test(10, 1618, 8317)
test(17, 1104, 2764)
test(21, 6111, 54718)
test(30, 5807, 37305)