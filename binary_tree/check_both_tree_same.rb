# ## Check if two trees are identical
# Problem Statement:
# ------------------
# Given two Binary Trees, return if true if the two trees are identical, otherwise return false..
# Two trees are said to be identical if these three conditions are met for every pair of nodes :
# Value of a node in the first tree is equal to the value of the corresponding node in the second tree.
# Left subtree of this node is identical to the left subtree of the corresponding node.
# Right subtree of this node is identical to the right subtree of the corresponding node.

# Example 1:
# Input:Binary Tree 1: 1 2 3 -1 -1 4 5, Binary Tree 2: 1 2 3 -1 -1 4 5
# Output: True, these trees are identical.
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

  def self.is_same(tree1, tree2)
  	return true if (tree1.nil? && tree2.nil?)
  	return false if (tree1.nil? || tree2.nil?)
  	return true if (tree1.value == tree2.value && BinaryTree.is_same(tree1.left, tree2.left) && BinaryTree.is_same(tree1.right, tree2.right) )
    return false
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
end
tree1 = [2,3,-1,-1,4,5]
tree2 = [2,3,-1,-1,4,5]
binary_tree1 = BinaryTree.new(tree1)
binary_tree2 = BinaryTree.new(tree2)
p BinaryTree.is_same(binary_tree1.root, binary_tree2.root)

## Example 
tree11 = [2,3,-1,-1,4,5,6]
tree22 = [2,3,-1,-1,4,5]
binary_tree11 = BinaryTree.new(tree11)
binary_tree22 = BinaryTree.new(tree22)
p BinaryTree.is_same(binary_tree11.root, binary_tree22.root)