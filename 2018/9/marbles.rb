class Marble
    attr_reader :number
    attr_accessor :prev, :next

    def initialize(number=0, prev=self, next2=self)
        @number = number
        @prev = prev
        @next = next2
    end
end

def high_score(players, last_marble)
    scores = {}
    current_marble = Marble.new()
    available_marbles = (1..last_marble).to_a

    available_marbles.each do |marble_num|
        if marble_num % 23 == 0
            marble_to_remove = current_marble.prev.prev.prev.prev.prev.prev.prev

            marble_to_remove.prev.next = marble_to_remove.next
            marble_to_remove.next.prev = marble_to_remove.prev

            scores[marble_num % players] ||= 0
            scores[marble_num % players] += (marble_num + marble_to_remove.number)

            current_marble = marble_to_remove.next
        else
            marble = Marble.new(marble_num, current_marble.next, current_marble.next.next)
            current_marble.next.next.prev = marble
            current_marble.next.next = marble
            current_marble = marble
        end
    end
    return scores.max_by {|k,v| v}[1]
end

puts "Part1 = #{high_score(428,72061)}"
puts "Part2 = #{high_score(428,7206100)}"