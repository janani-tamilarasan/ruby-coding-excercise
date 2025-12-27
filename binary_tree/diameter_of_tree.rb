
class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  # Returns the diameter of the tree
  def find_diameter
    @diameter = 0
    height(@root)
    @diameter + 1
  end

  private

  # Build tree from array (level-order)
  def build_tree(arr)
    return nil if arr.empty? || arr[0].nil?

    root = TreeNode.new(arr[0])
    queue = [root]
    i = 1

    while i < arr.length
      current = queue.shift

      if i < arr.length && !arr[i].nil?
        current.left = TreeNode.new(arr[i])
        queue << current.left
      end
      i += 1

      if i < arr.length && !arr[i].nil?
        current.right = TreeNode.new(arr[i])
        queue << current.right
      end
      i += 1
    end

    root
  end

  # Compute height and update diameter
  def height(node)
    return 0 if node.nil?

    left = height(node.left)
    right = height(node.right)

    @diameter = [@diameter, left + right].max

    1 + [left, right].max
  end
end

# Example usage
tree = BinaryTree.new([1, 2, 3, 4, 5])
p tree.find_diameter
