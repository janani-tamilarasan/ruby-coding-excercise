# Sort an array of 0s, 1s and 2s
# Given an array nums consisting of only 0, 1, or 2. Sort the array in non-decreasing order. The sorting must be done in-place, without making a copy of the original array.

# 	Input: nums = [1, 0, 2, 1, 0]
# 	Output: [0, 0, 1, 1, 2]
# 	Explanation: The nums array in sorted order has 2 zeroes, 2 ones and 1 two
# 	Input: nums = [0, 0, 1, 1, 1]
# 	Output: [0, 0, 1, 1, 1]
# 	Explanation: The nums array in sorted order has 2 zeroes, 3 ones and zero twos.


def sort_0s_1s_2s(ary)
	low_index = 0
	mid_index = 0
	high_index = ary.length - 1
	while mid_index <= high_index
		if(ary[mid_index] == 0)
           ary[mid_index], ary[low_index] = ary[low_index], ary[mid_index]
          low_index = low_index + 1
          mid_index = mid_index + 1
       elsif(ary[mid_index] == 2)
       	  ary[mid_index], ary[high_index] = ary[high_index], ary[mid_index]
          high_index = high_index - 1
         else
         mid_index = mid_index + 1
		end
	end
	
end

ary = [1, 0, 2, 1, 0]
 sort_0s_1s_2s(ary)
 p ary