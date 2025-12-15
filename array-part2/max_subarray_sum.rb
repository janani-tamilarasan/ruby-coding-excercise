# Kadane's Algorithm : Maximum Subarray Sum in an Array

# Problem Statement: Given an integer array nums, find the subarray with the largest sum and return the sum of the elements present in that subarray.

# A subarray is a contiguous non-empty sequence of elements within an array.

# Examples
# Example 1:
# Input:
#  nums = [2, 3, 5, -2, 7, -4]  
# Output:
#  15  
# Explanation:
#  The subarray from index 0 to index 4 has the largest sum = 15, which is the maximum sum of any contiguous subarray.

# Example 2:
# Input:
#  nums = [-2, -3, -7, -2, -10, -4]  
# Output:
#  -2  
# Explanation:
#  The largest sum is -2, which comes from taking the element at index 0 or index 3 as the subarray. Since all numbers are negative, the subarray with the least negative number gives the largest sum.

def max_subarray_sum(ary)
  sum = 0
  max_sum = -Float::INFINITY

  start_index = 0
  best_start = 0
  best_end = 0

  ary.each_with_index do |el, end_index|
    sum += el

    if sum > max_sum
      max_sum = sum
      best_start = start_index
      best_end = end_index
    end

    if sum < 0
      sum = 0
      start_index = end_index + 1
    end
  end

  p [best_start, best_end]   # subarray indices
  max_sum
end

ary = [-2, -3, -7, -2, -10, -4]
p max_subarray_sum(ary)

