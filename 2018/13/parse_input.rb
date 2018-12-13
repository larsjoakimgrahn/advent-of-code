data = File.readlines('input.txt')

$carts = []
$grid = {}
data.each_with_index do |line, y|
    line.split(//).each_with_index do |c, x|
        case c
        when '-','|','/','\\','+'
            $grid[[x,y]] = c
        when '<','>','^','v'
            cart = Cart.new(x,y,c)
            $carts << cart
            $grid[[x,y]] = cart.to_grid
        end
    end
end