class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    def parent=(node)
        old_parent = self.parent
        if old_parent != nil
            chil = old_parent.children
            chil.delete(self)
        end

        @parent = node
        
        if node != nil && !node.children.include?(self)
            node.children << self
        end
    end
    def add_child(child_node)
        child_node.parent = self
    end
    def remove_child(child_node)
        child_node.parent = nil
        raise 'error' if child_node.parent == nil
    end
    def dfs(target_value)
        if self.value == target_value
            return self
        end
        if self == nil
            return nil
        end
        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end 
    def bfs(target_value)
        tree = [self]
        until tree.empty?
            ele = tree.shift
            if ele.value == target_value
                return ele
            end
            ele.children.each do |child|
                tree << child
            end
        end
    end
end