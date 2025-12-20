# Count Subarray sum Equals K
# Problem Statement: Given an array of integers and an integer k, return the total number of subarrays whose sum equals k. A subarray is a contiguous non-empty sequence of elements within an array.
# Example:
# Input : N = 4, array[] = {3, 1, 2, 4}, k = 6
# Output: 2
# Explanation: The subarrays that sum up to 6 are [3, 1, 2] and [2, 4].

# Input: N = 3, array[] = {1,2,3}, k = 3
# Output: 2
# Explanation: The subarrays that sum up to 3 are [1, 2], and [3].

def count_subarray_of_equal_k(ary,k)
	prefix_sum = 0
	count = 0
	hash = Hash.new(0)
	hash[0] = 1

	ary.each do |el|
		prefix_sum +=el
		remove = prefix_sum - k
		p "remove #{remove} #{hash[remove]}"
		if(hash[remove])
			value = hash[remove]
			count +=value
		end
		hash[prefix_sum] = (hash[el] || 0) + 1
	end
	count
end

p count_subarray_of_equal_k([3, 1, 2, 4],6)