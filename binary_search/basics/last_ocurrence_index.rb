def last_occurence_index(ary, target)
	low = 0
	high = ary.length - 1 
	index = -1
	while low <= high do 
		mid = (low + high)/2
		if(ary[mid] == target)
			index = mid
		end

		if ary[mid] <= target
			low =  mid + 1
		else
			high = mid - 1
		end
	end
	index
end

ary = [3, 4, 13, 13, 13, 20, 40]
target = 13

p last_occurence_index(ary, target)
p last_occurence_index(ary, 60)