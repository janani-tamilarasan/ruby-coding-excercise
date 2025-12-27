# ## Maximum depth of a Binary Tree

# ### Problem Statement:
# 	Given the root of a Binary Tree, return the height of the tree. The height of the tree is equal to the number of nodes on the longest path from root to a leaf.
# 	Ex: 1 
# 	Input: Binary Tree: 1 2 5 -1 -1 4 6 5
# 	Output: 4
# 	Explanation: 
# 	In the above example, the height of the binary tree is along the longest path from the root node 1 -> 5 -> 4 -> 5.
# 	Ex: 2 
# 	Input: Binary Tree: 3 1 2
# 	Output: 2
# 	Explanation: 
# 	We traverse the binary tree in the order of Left, RIght then Root recursively resulting in the following traversal

class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end


class BinaryTree
  attr_reader :root

  def initialize(arr = [])
    @root = build_from_array(arr)
  end

  def max_depth
    depth(@root)
  end

  private

  def build_from_array(arr)
    return nil if arr.empty? || arr[0] == -1

    root = TreeNode.new(arr[0])
    queue = [root]
    i = 1

    while i < arr.length
      current = queue.shift

      if i < arr.length && arr[i] != -1
        current.left = TreeNode.new(arr[i])
        queue << current.left
      end
      i += 1

      if i < arr.length && arr[i] != -1
        current.right = TreeNode.new(arr[i])
        queue << current.right
      end
      i += 1
    end

    root
  end

  def depth(node)
    return 0 if node.nil?
    1 + [depth(node.left), depth(node.right)].max
  end
end



tree = BinaryTree.new([1, 2, 5, -1, -1, 4, 6, 5])
puts tree.max_depth

