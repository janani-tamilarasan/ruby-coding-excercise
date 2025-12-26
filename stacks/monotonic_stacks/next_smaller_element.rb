# Next Smaller Element

# Problem Statement: 
# Given an array of integers arr, your task is to find the Next Smaller Element (NSE) for every element in the array.
# The Next Smaller Element for an element x is defined as the first element to the right of x that is smaller than x.
# If there is no smaller element to the right, then the NSE is -1.
# Example 1:
# Input:
#  arr = [4, 8, 5, 2, 25]
# Output:
#  [2, 5, 2, -1, -1]
# Explanation:

# - For 4, the next smaller element is 2.
# - For 8, the next smaller element is 5.
# - For 5, the next smaller element is 2.
# - For 2, there is no smaller element to its right → -1.
# - For 25, no smaller element exists → -1.

# Example 2:
# Input:
#  arr = [10, 9, 8, 7]
# Output:
#  [9, 8, 7, -1]
# Explanation:

# Each element’s next right neighbor is smaller.
# Each element’s next right neighbor is smaller.

def next_smaller_ele(arr)
  n = arr.length
  stack = []

  (2 * n - 1).downto(0) do |i|
    idx = i % n
    current = arr[idx]

    while !stack.empty? && stack[-1] >= current
      stack.pop
    end

    arr[idx] = stack.empty? ? -1 : stack[-1] if i < n
    stack.push(current)
  end

  arr
end

# p next_smaller_ele([4, 8, 5, 2, 25])
p next_smaller_ele([3, 1, 2, 5])

# Time Complexity: O(N), since each element is pushed and popped at most once.

# Space Complexity: O(N), since stack may hold up to N elements in the worst case.