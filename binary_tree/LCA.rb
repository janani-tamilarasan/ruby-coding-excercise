// Definition for a binary tree node.
class TreeNode {
    constructor(val = 0, left = null, right = null) {
        this.data = val;
        this.left = left;
        this.right = right;
    }
}

class Solution {
    lowestCommonAncestor(root, p, q) {
        // Base case
        if (root === null || root === p || root === q) {
            return root;
        }
        
        // Search in left and right subtrees
        let left = this.lowestCommonAncestor(root.left, p, q);
        let right = this.lowestCommonAncestor(root.right, p, q);
        
        // Result
        if (left === null) {
            return right;
        } else if (right === null) {
            return left;
        } else { // Both left and right are not null, we found our result
            return root;
        }
    }
}

// Example usage
let root = new TreeNode(3);
root.left = new TreeNode(5);
root.right = new TreeNode(1);
root.left.left = new TreeNode(6);
root.left.right = new TreeNode(2);
root.right.left = new TreeNode(0);
root.right.right = new TreeNode(8);

let solution = new Solution();
let p = root.left; // Node with value 5
let q = root.right; // Node with value 1

let lca = solution.lowestCommonAncestor(root, p, q);
console.log("Lowest Common Ancestor:", lca.data);