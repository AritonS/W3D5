require_relative "./skeleton-2/lib/00_tree_node.rb"
class KnightPathFinder
    attr_reader :root_node
    def initialize(position)
        @board = Array.new(8){Array.new(8, " ")}
        @root_node = PolyTreeNode.new(position)
    end
    # def [](pos)
    #     row, col = pos 
    #     @root_node[row][col].value
    # end
    def new_move_positions(pos)
        if !@considered_positions.include?(pos)
            KnightPathFinder.valid_moves(pos)
        end
    end
    def self.valid_moves(pos) # [4, 3]
        @considered_positions = [@root_node.value]
    end
    
    
    def build_move_tree
        position = @root_node.value
        @root_node.add_child(PolyTreeNode.new([position[0] + 2, position[1] + 1]))
    end
end