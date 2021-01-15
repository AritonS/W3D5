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
        KnightPathFinder.valid_moves(pos)
    end
    def self.valid_moves(pos) # [4, 3]
        row, col = pos
        @considered_positions = []
        moves = [[+2, +1],
                [+1, +2],
                [-2, -1],
                [-1, -2],
                [-2, +1],
                [-1, +2],
                [+2, -1],
                [+1, -2]]

        moves.each do |move|
            new_pos = [move[0]+row, move[1] + col]
                if valid_position?(new_pos) && !@considered_positions.include?(new_pos)
                    @considered_positions << new_pos
                end
        end
        return  @considered_positions
    end
    
    def valid_position?(pos)
        row, col = pos
        return false if row < 0 || row > 7
        return false if col < 0 || row > 7
        true
    end
    
    def build_move_tree
        tree = [@root_node.value]
        new_arr = new_move_positions(@root_node.value)
        until tree.empty?
            ele = tree.shift
            new_arr.each do |child|
                tree << @root_node.add_child(PolyTreeNode.new(child))
            end
        end


        # position = @root_node.value
        # @root_node.add_child(PolyTreeNode.new([position[0] + 2, position[1] + 1]))
    end
end