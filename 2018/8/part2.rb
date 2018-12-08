$input_data = File.readlines('input.txt')[0].split().map { |v| v.to_i }
class TNode

    def initialize
        @children = []
        @metadata = []
    end

    def add_child(child)
        @children << child
    end

    def set_metadata(metadata)
        @metadata = metadata
    end

    def value()
        if @children.empty?
            return @metadata.reduce(0, :+)
        else
            total_value = 0
            @metadata.each do |m|
                if m > @children.size || m == 0
                    next
                else
                    total_value += @children[m-1].value()
                end
            end
            return total_value
        end
    end
end

def parse(children, metadata)
    node = TNode.new()
    for _ in 0...(children) do
        node.add_child(parse($input_data.shift, $input_data.shift))
    end

    node.set_metadata($input_data.shift(metadata))
    return node
end

node = parse($input_data.shift, $input_data.shift)
puts "#{node.value()}"