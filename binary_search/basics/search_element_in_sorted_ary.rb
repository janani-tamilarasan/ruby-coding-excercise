def search_ele_sorted_rotation_ary(ary,target)
	low = 0
	high = ary.length - 1
	while low <= high do
		mid = (low + high)/2
		return mid if(ary[mid] == target)
		if(ary[low] < ary[mid])
			if (ary[low] < target && target < ary[high])
				high = mid - 1
			else
				low = low + 1
			end
		else
			if(ary[high] > target && target < ary[low])
				low = mid + 1
			else
				high = mid - 1
			end
		end
	end
   return -1
end

p search_ele_sorted_rotation_ary([4, 5, 6, 7, 0, 1, 2],0)
p search_ele_sorted_rotation_ary([4, 5, 6, 7, 0, 1, 2],3)
p search_ele_sorted_rotation_ary([4, 5, 6, 7, 0, 1, 2],7)

# Time Complexity: O(log N),We eliminate half of the search space in each iteration using binary search.

# Space Complexity: O(1),We use only a few variables (low, high, mid) no extra space used