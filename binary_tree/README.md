## Maximum depth of a Binary Tree

### Problem Statement:
	Given the root of a Binary Tree, return the height of the tree. The height of the tree is equal to the number of nodes on the longest path from root to a leaf.
	Ex: 1 
	Input: Binary Tree: 1 2 5 -1 -1 4 6 5
	Output: 4
	Explanation: 
	In the above example, the height of the binary tree is along the longest path from the root node 1 -> 5 -> 4 -> 5.
	Ex: 2 
	Input: Binary Tree: 3 1 2
	Output: 2
	Explanation: 
	We traverse the binary tree in the order of Left, RIght then Root recursively resulting in the following traversal

### Algorithm(using bfs)
### Intution:
    height can be called recursively
	** height = 1 + max(left_subtree_height, right_subtree_height)**

 - 1. Build the tree with given ary
 - 2. Recursive find the 1 + max(recusiveFn(root.left), recusiveFn(root.right))**

### Time complexity
O(n) + O(n) = O(n)
### Space complexity
O(n) + O(n) = O(n)

--

## Check if the Binary Tree is Balanced Binary Tree

Problem Statement: 
------------------

Given a Binary Tree, return true if it is a Balanced Binary Tree else return false. A Binary Tree is balanced if, for all nodes in the tree, the difference between left and right subtree height is not more than 1.

	Example 1:
	Input : [3, 9, 20, null, null, 15, 7]
	Output : Yes
	Explanation:
	height of left tree  = 1 height of right tree =  2
	difference of height of left tree - height of right tree 
	1 - 2 = -1 < 0 so it binary tree

### Algorithm(using bfs)
### Intution:

    - checking the balance condition while traversing the tree in a bottom-up manner. Instead of repeatedly calculating the height at each node, we compute subtree heights during postorder traversal and evaluate the balance condition at the same time.
   - This avoids redundant height calculations and allows early detection of unbalanced nodes, thereby preventing unnecessary recursive calls. Postorder traversal helps ensure that we already have the height information of both subtrees when we assess the balance condition at any node.


   - 1. Traverse the Binary Tree in post-order using recursion: visit the left subtree, then the right subtree, and finally the current node.
   - 2. At each node, compute the height of its left and right subtrees using recursive calls.
   - 3. Check the absolute difference between the heights of the left and right subtrees. If the difference is greater than 1, or if either subtree is already unbalanced (returns -1), return -1 to indicate an unbalanced state.
   - 4. If the subtree is balanced, return the height of the current node as max(left height, right height) + 1.
   - 5. Continue the traversal until all nodes are visited. If no -1 is returned, the tree is balanced.

### Time Complexity: O(N), 
where N is the number of nodes in the Binary Tree. Each node is visited exactly once during the postorder traversal.

### Space Complexity: O(1), 
since no extra data structures are used that grow with input size. However, O(H) auxiliary space is used by the recursion stack, where H is the height of the tree. In the best case (balanced tree), H = log₂N; in the worst case (skewed tree), H = N.

--

## Diameter of bianary tree
Problem Statement: 
------------------

Given the root of the Binary Tree, return the length of its diameter. The Diameter of a Binary Tree is the longest distance between any two nodes of that tree. This path may or may not pass through the root.

Example 1:
1 2 3 4 5
Output: 4
Explanation: The distance between the leftmost node 4 and the rightmost node 3 is 4, since this is the longest horizontal distance of the binary tree, hence its diameter.

### Algorithm(using bfs)
### Intution:

	Total Width = 1 + Depth of Left Side + Depth of Right Side


	- Using bottom up atppraoch LRootRight
	- build a tree
	- Find the left and rught of tree and and  it dd ot to find the diameter.
	- Measure how deep the left part goes, then do the same for the right part.
    - Add the two depths and 1 (for the current point) to get the width at this point.
    - Compare this width with the largest one we've seen so far and update it if it's bigger.


### Time Complexity: O(N) 
where N is the number of nodes in the Binary Tree. This complexity arises from visiting each node exactly once during the postorder traversal.

### Space Complexity : O(1) 
as no additional space or data structures is created that is proportional to the input size of the tree.

--
## Check if two trees are identical
Problem Statement:
------------------
Given two Binary Trees, return if true if the two trees are identical, otherwise return false..
Two trees are said to be identical if these three conditions are met for every pair of nodes :
Value of a node in the first tree is equal to the value of the corresponding node in the second tree.
Left subtree of this node is identical to the left subtree of the corresponding node.
Right subtree of this node is identical to the right subtree of the corresponding node.

Example 1:
Input:Binary Tree 1: 1 2 3 -1 -1 4 5, Binary Tree 2: 1 2 3 -1 -1 4 5
Output: True, these trees are identical.

### Algorithm
### Intiution
  To find the similar tree, we need to pre-travelsa l of both tree and  heck if node of val is simlar to anoyerh node of value

 - 1. Check if the values of the current nodes in both trees are equal. If not, return false.
 - 2. Recursively check if the left subtree of both the trees is identical.
 - 3. Recursively check if the right subtree of both the trees is identical.
 - 4. If all recursive calls return true, the trees are identical.


### Time Complexity: O(N + M) 
where N is the number of nodes in the first Binary Tree and M is the number of nodes in the second Binary Tree. This complexity arises from visiting each node of both trees during their comparison.

### Space Complexity: O(1) 
as no additional space or data structures are created that are proportional to the input size of the tree.

--

## Zig Zag Traversal Of Binary Tree
Problem Statement: 
------------------

Given a Binary Tree, print the zigzag traversal of the Binary Tree. Zigzag traversal of a binary tree is a way of visiting the nodes of the tree in a zigzag pattern, alternating between left-to-right and right-to-left at each level.
Input:Binary Tree: 1 2 3 4 5 -1 6
Output: [[1],[3, 2],[4, 5, 6]]
Explanation: 

Level 1 (Root): Visit the root node 1 from left to right. Zigzag Traversal: [1]
Level 2: Visit nodes at this level in a right-to-left order. Zigzag Traversal:  [1], [3, 2]
Level 3: Visit nodes at this level in a left-to-right order. Zigzag Traversal:  [1], [3, 2], [4, 5, 6]

### Algorithm(BFS)
### Intuition Behind Zigzag (Spiral) Traversal

#### Level Order Traversal is BFS:

	Normally, in level order traversal, we go level by level from left to right.ee use a queue to keep track of nodes at the current level.
#### Zigzag Twist:
	Instead of always adding node values left → right, we alternate the direction at each level:
	Level 0 → left → right
	Level 1 → right → left
	Level 2 → left → right
	This creates the "zigzag" pattern.

### Key Trick:

	Use a left_to_right boolean flag to determine the order of insertion.
	At each level, calculate the index where the node’s value should go:
	index = left_to_right ? i : size - 1 - i
	This allows us to fill the array in the correct order without reversing it later.

#### Edge Case: Return [] if root is nil.

   - 1. Initialize: Queue: q = [root] Result: result = [] Flag: left_to_right = true

	- 2. While the queue is not empty:
	size = q.length
	level = Array.new(size)
	For each node in current level:
	node = q.shift
	index = left_to_right ? i : size - 1 - i
	level[index] = node.val
	q.push(node.left) if node.left
	q.push(node.right) if node.right
	result << level
	left_to_right = !left_to_right
### Time Complexity: O(n), 
### Space Complexity: O(n)

--

## Top view of a Binary Tree

Problem Statement: 
------------------
Given a Binary Tree, return its Top View. The Top View of a Binary Tree is the set of nodes visible when we see the tree from the top.
Input:Binary Tree: 1 2 3 4 10 9 11 -1 5 -1 -1 -1 -1 -1 -1 -1 6
Output: Top View: [4, 2, 1, 3, 11]
Explanation: Input:Binary Tree: 2 7 5 2 6 -1 9 -1 -1 5 11 4 -1

### Intuition
Top View = first node seen in each vertical line when looking from the top
Think like this:
Imagine standing above the tree
Nodes are grouped by vertical distance (column)
For each column, only the first node encountered in BFS matters

### Key Observations

	Use vertical index (column)
	Root → 0
	Left child → -1
	Right child → +1
	Store first occurrence only
	Final answer must be printed left → right (sorted columns)

## Bottom view of a Binary Tree

Problem Statement: 
------------------
Given a Binary Tree, return its Bottom View. The Bottom View of a Binary Tree is the set of nodes visible when we see the tree from the bottom.
Input:Binary Tree: 1 2 3 4 10 9 11 -1 5 -1 -1 -1 -1 -1 -1 -1 6
Output:Bottom View Traversal: [4, 5, 6, 3, 11]
Explanation: The bottom view of the binary tree would comprise of the nodes that are the last encountered nodes for each vertical index

### Time Complexity: O(N) 
where N is the number of nodes in the Binary Tree. This complexity arises from visiting each node exactly once during the BFS traversal.

### Space Complexity: O(N/2 + N/2) w
here N represents the number of nodes in the Binary Tree.

## Right/Left view of binary tree
Problem Statement: 
Assuming standing on the right side of a binary tree and given its root, return the values of the nodes visible, arranged from top to bottom.


## Maximum Sum Path in Binary Tree
Problem Statement:
----------------------
Given a Binary Tree, determine the maximum sum achievable along any path within the tree. A path in a binary tree is defined as a sequence of nodes where each pair of adjacent nodes is connected by an edge. Nodes can only appear once in the sequence, and the path is not required to start from the root. Identify and compute the maximum sum possible along any path within the given binary tree.
Input: Binary Tree: -10 9 20 -1 -1 15 7
Output: 42
Explanation: 
Out of all the paths possible in the Binary Tree, 15 -> 20 -> 7 has the greatest sum ie. 42.



## LCA in Binary Tree

Problem Statement: 
-----------------
Given a root of binary tree, find the lowest common ancestor (LCA) of two given nodes (p, q) in the tree.

The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).