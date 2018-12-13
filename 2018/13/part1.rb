load 'cart.rb'
data = File.readlines('input.txt')

carts = []
grid = {}
data.each_with_index do |line, y|
    line.split(//).each_with_index do |c, x|
        case c
        when '-','|','/','\\','+'
            grid[[x,y]] = c
        when '<','>','^','v'
            cart = Cart.new(x,y,c)
            carts << cart
            grid[[x,y]] = cart.to_grid
        end
    end
end

loop do
    carts.sort! { |a, b| [a.y, a.x] <=> [b.y, b.x] }

    positions = Hash[carts.map {|c| "#{c.x},#{c.y}" }.collect{|c| [c,true]} ]
    carts.each do |cart|
        pos_before = "#{cart.x},#{cart.y}"
        new_pos = cart.move(grid)
        if positions[new_pos] == true
            puts "CRASH! = #{new_pos}"
            exit
        else
            positions[pos_before] = false
            positions[new_pos] = true
        end
    end
end