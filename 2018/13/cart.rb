class Cart
    attr_reader :x, :y, :direction
    attr_accessor :deleted
    def initialize(x,y,direction)
        @x = x
        @y = y
        @direction = direction
        @num_turns = 0
        @turn_order = ['left', 'straight', 'right']
        @deleted = false
    end

    def turn_dir()
        turn_dir = @turn_order[@num_turns % @turn_order.length]
        @num_turns += 1
        return turn_dir
    end

    def move(grid)
        case @direction
        when '^'
            case grid[[@x,@y-1]]
            when '\\'
                @direction = '<'
            when '/'
                @direction = '>'
            when '+'
                t_dir = turn_dir()
                case t_dir
                when 'left'
                    @direction = '<'
                when 'right'
                    @direction = '>'
                end
            end
            @y = @y-1
            # puts "moving up"
        when 'v'
            case grid[[@x,@y+1]]
            when '\\'
                @direction = '>'
            when '/'
                @direction = '<'
            when '+'
                t_dir = turn_dir()
                case t_dir
                when 'left'
                    @direction = '>'
                when 'right'
                    @direction = '<'
                end
            end
            @y = @y+1
            # puts "moving down"
        when '>'
            case grid[[@x+1,@y]]
            when '\\'
                @direction = 'v'
            when '/'
                @direction = '^'
            when '+'
                t_dir = turn_dir()
                case t_dir
                when 'left'
                    @direction = '^'
                when 'right'
                    @direction = 'v'
                end
            end
            @x = @x+1
            # puts "moving right"
        when '<'
            case grid[[@x-1,@y]]
            when '\\'
                @direction = '^'
            when '/'
                @direction = 'v'
            when '+'
                t_dir = turn_dir()
                case t_dir
                when 'left'
                    @direction = 'v'
                when 'right'
                    @direction = '^'
                end
            end
            @x = @x-1
            # puts "moving left"
        end
        return "#{@x},#{@y}"
    end

    def to_grid()
        case @direction
        when '^','v'
            return '|'
        when '<','>'
            return '-'
        end
    end

    def eql?(other)
         @x == other.x && @y == other.y
    end
end