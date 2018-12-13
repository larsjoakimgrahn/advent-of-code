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
    # puts "#{carts}"

    positions = Hash[carts.collect{|c| ["#{c.x},#{c.y}",c]} ]
    carts.each do |cart|
        if (cart.deleted)
            next
        end
        pos_before = "#{cart.x},#{cart.y}"
        new_pos = cart.move(grid)
        if(positions[new_pos] && !positions[new_pos].deleted)
            puts "CRASH! = #{new_pos}"
            positions[new_pos].deleted = true
            cart.deleted = true
        else
            positions[pos_before] = false
            positions[new_pos] = cart
        end
    end
    if carts.select{|c| !c.deleted}.length == 1
        puts "final pos: #{carts.select{|c| !c.deleted}[0].x}, #{carts.select{|c| !c.deleted}[0].y}"
        exit
    else
        # puts carts.select{|c| !c.deleted}.length
    end
end