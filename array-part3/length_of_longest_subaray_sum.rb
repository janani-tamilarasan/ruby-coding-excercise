# **Length of the longest subarray with zero Sum**

# Problem Statement: 
# -----------------

# Given an array containing both positive and negative integers, we have to find the length of the longest subarray with the sum of all elements equal to zero.
# Example 1:
# Input:
#  N = 6, array[] = {9, -3, 3, -1, 6, -5}  
# Result:
#  5  
# Explanation:
#  The following subarrays sum to zero:
# - {-3, 3}
# - {-1, 6, -5}
# - {-3, 3, -1, 6, -5}
# The length of the longest subarray with sum zero is 5.

# Example 2:
# Input:
#  N = 8, array[] = {6, -2, 2, -8, 1, 7, 4, -10}  
# Result:
#  8  
# Explanation:
#  Subarrays with sum zero:
# - {-2, 2}
# - {-8, 1, 7}
# - {-2, 2, -8, 1, 7}
# - {6, -2, 2, -8, 1, 7, 4, -10}
# The length of the longest subarray with sum zero is 8.

def length_of_longest_subaray_sum(ary)
	prefix_sum = 0

	max_len = 0
	n = ary.length
	hash = {}
	(0...n).each do |index|
		prefix_sum += ary[index]
		if(prefix_sum == 0)
		  max_len = index + 1
		elsif (hash[prefix_sum])
			len = prefix_sum - hash[prefix_sum]
			max_len = [len,max_len].max()
		else
			hash[prefix_sum] = index
		end
	end
    max_len
end

p length_of_longest_subaray_sum([6, -2, 2, -8, 1, 7, 4, -10])