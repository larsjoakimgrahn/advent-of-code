$input_data = File.readlines('input.txt')[0].split().map { |v| v.to_i }
class TNode
    attr_reader :children
    attr_writer :metadata
    def initialize
        @children = []
        @metadata = []
    end

    def value()
        @children.empty? ? @metadata.sum : @metadata.map { |m| @children[m-1]&.value }.compact.sum
    end
end

def parse(children, metadata)
    node = TNode.new()
    Array.new(children).each do
        node.children << parse($input_data.shift, $input_data.shift)
    end

    node.metadata = $input_data.shift(metadata)
    return node
end

node = parse($input_data.shift, $input_data.shift)
puts "#{node.value()}"