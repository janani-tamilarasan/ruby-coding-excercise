# Class to represent a binary tree node
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

# Solution class
class Solution
  # Function to perform zigzag level order traversal
  def zigzag_level_order(root)
    result = []
    return result if root.nil?

    queue = [root]
    left_to_right = true

    while !queue.empty?
      size = queue.length
      level = Array.new(size)

      size.times do |i|
        node = queue.shift

        # Determine index depending on traversal direction
        index = left_to_right ? i : size - 1 - i
        level[index] = node.val

        queue.push(node.left) if node.left
        queue.push(node.right) if node.right
      end

      result << level
      left_to_right = !left_to_right
    end

    result
  end
end

# Driver code
def main
  # Create binary tree
  #        1
  #      /   \
  #     2     3
  #    / \     \
  #   4   5     6
  root = TreeNode.new(1)
  root.left = TreeNode.new(2)
  root.right = TreeNode.new(3)
  root.left.left = TreeNode.new(4)
  root.left.right = TreeNode.new(5)
  root.right.right = TreeNode.new(6)

  sol = Solution.new
  ans = sol.zigzag_level_order(root)
  p ans
end

main
