# Next Greater Element Using Stack
# Problem Statement: 
# Given an integer array A, return the next greater element for every element in A. The next greater element for an element x is the first element greater than x that we come across while traversing the array in a clockwise manner. If it doesn't exist, return -1 for this element.
# Input: arr = [1, 3, 2, 4]
# Output: [3, 4, 4, -1]
# Explanation: In the array, the next larger element to 1 is 3, 3 is 4, 2 is 4 and for 4 is -1, since it does not exist.
# Input : arr = [6, 8, 0, 1, 3]
# Output: [8, -1, 1, 3, -1]
# Explanation : In the array, the next larger element to 6 is 8, for 8 there is no larger elements hence it is -1, for 0 it is 1 , for 1 it is 3 and then for 3 there is no larger element on the right and hence -1.

def next_greater_element(arr)
  n = arr.length
  stack = []

  (2 * n - 1).downto(0) do |i|
    idx = i % n
    current = arr[idx]  # preserve original value

    while !stack.empty? && current >= stack[-1]
      stack.pop
    end

    arr[idx] = stack.empty? ? -1 : stack[-1] if i < n
    stack.push(current)
  end

  arr
end

p next_greater_element([1, 3, 2, 4])
p next_greater_element([6, 8, 0, 1, 3])
# circluar
p next_greater_element([3, 10, 4, 2, 1, 2, 6, 1, 7, 2, 9])
p next_greater_element([5, 7, 1, 7, 6, 0])

