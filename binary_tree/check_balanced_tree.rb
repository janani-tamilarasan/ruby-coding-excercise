# ## Check if the Binary Tree is Balanced Binary Tree

# Problem Statement: 
# ------------------

# Given a Binary Tree, return true if it is a Balanced Binary Tree else return false. A Binary Tree is balanced if, for all nodes in the tree, the difference between left and right subtree height is not more than 1.

# 	Example 1:
# 	Input : [3, 9, 20, null, null, 15, 7]
# 	Output : Yes
# 	Explanation:
# 	height of left tree  = 1 height of right tree =  2
# 	difference of height of left tree - height of right tree 
# 	1 - 2 = -1 < 0 so it binary tree

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

	def initialize(ary)
		@root = build_tree(ary)
	end

	def balanced?
	    dfs_height(root) != -1
    end

	  private


	def build_tree(ary)
		return nil if(ary.length == 0 || ary[0].nil?)

		root = TreeNode.new(ary[0])
		queue = [root]
		index  = 1
		 while index < ary.length
			current_node = queue.shift

			if(index < ary.length && ary[index] != 1)
				current_node.left = TreeNode.new(ary[index])
                queue.push(current_node.left)
			end
			index = index + 1

			if(index < ary.length && ary[index] != 1)
				current_node.right = TreeNode.new(ary[index])
                queue.push(current_node.right)
			end
			index = index + 1
		end
		root
	end

	  def dfs_height(node)
	    return 0 if node.nil?

	    left_height = dfs_height(node.left)
	    return -1 if left_height == -1

	    right_height = dfs_height(node.right)
	    return -1 if right_height == -1

	    return -1 if (left_height - right_height).abs > 1

	    [left_height, right_height].max + 1
	  end
end

tree = BinaryTree.new([3, 9, 20, nil, nil, 15, 7])
p tree.balanced?