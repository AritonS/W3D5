require_relative "./skeleton-2/lib/00_tree_node.rb"
class KnightPathFinder
    attr_reader :root_node
    def initialize(position)
        @board = Array.new(8){Array.new(8, " ")}
        @root_node = PolyTreeNode.new(position)
    end
    def build_move_tree
        
    end
end