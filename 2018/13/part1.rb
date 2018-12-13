load 'cart.rb'
load 'parse_input.rb'

loop do
    $carts.sort! { |a, b| [a.y, a.x] <=> [b.y, b.x] }

    positions = Hash[$carts.map {|c| "#{c.x},#{c.y}" }.collect{|c| [c,true]} ]
    $carts.each do |cart|
        pos_before = "#{cart.x},#{cart.y}"
        new_pos = cart.move($grid)
        if positions[new_pos] == true
            puts "CRASH! = #{new_pos}"
            exit
        else
            positions[pos_before] = false
            positions[new_pos] = true
        end
    end
end