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

  def initialize(root)
    @root = root
    @max_sum = -Float::INFINITY
  end

  def max_path_sum
    dfs(root)
    @max_sum
  end

  private

  def dfs(node)
    return 0 if node.nil?

    # Get max path sum from left and right (ignore negatives)
    left = [0, dfs(node.left)].max
    right = [0, dfs(node.right)].max

    # Update global max (turning point)
    current_sum = left + right + node.value
    @max_sum = [@max_sum, current_sum].max

    # Return one-sided max path
    [left, right].max + node.value
  end
end
