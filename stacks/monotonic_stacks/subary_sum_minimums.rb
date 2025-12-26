# Sum of Subarray Minimums
# Problem Statement: 
# Given an array of integers arr of size n, calculate the sum of the minimum value in each (contiguous) subarray of arr. Since the result may be large, return the answer modulo 10⁹ +7.
# Example 1:
# Input:
#  arr = [3, 1, 2, 5]
# Output:
#  18
# Explanation:
#  The minimum of subarrays: [3], [1], [2], [5], [3, 1], [1, 2], [2, 5], [3, 1, 2], [1, 2, 5], [3, 1, 2, 5] are 3, 1, 2, 5, 1, 1, 2, 1, 1, 1 respectively and their sum is 18.

# Example 2:
# Input:
#  arr = [2, 3, 1]
# Output:
#  10
# Explanation:
#  The minimum of subarrays: [2], [3], [1], [2,3], [3,1], [2,3,1] are 2, 3, 1, 2, 1, 1 respectively and their sum is 10.

def subary_sum_minimum(arr)
  mod = 1_000_000_007
  n = arr.length

  pse = find_previous_smaller_index(arr)
  nse = find_next_smaller_index(arr)

  total = 0

  (0...n).each do |i|
    left = i - pse[i]
    right = nse[i] - i
    total = (total + arr[i] * left * right) % mod
  end

  total
end

def find_next_smaller_index(arr)
  n = arr.length
  stack = []
  nse = Array.new(n, n)

  (n - 1).downto(0) do |i|
    while !stack.empty? && arr[stack[-1]] >= arr[i]
      stack.pop
    end

    nse[i] = stack.empty? ? n : stack[-1]
    stack.push(i)
  end

  nse
end

def find_previous_smaller_index(arr)
  n = arr.length
  stack = []
  pse = Array.new(n, -1)

  (0...n).each do |i|
    while !stack.empty? && arr[stack[-1]] > arr[i]
      stack.pop
    end

    pse[i] = stack.empty? ? -1 : stack[-1]
    stack.push(i)
  end

  pse
end


p subary_sum_minimum([3, 1, 2, 5])
