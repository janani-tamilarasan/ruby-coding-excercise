
def first_occurences_of_sorted_ary(ary,x)
	low = 0
	high = ary.length - 1
    ans = -1
	while low <=high do

		mid = (low + high)/2


		if(ary[mid] >= x)
			ans = mid

			high = mid - 1
		else
			low = mid + 1
		end
	end
	ans
end

def last_occurences_of_sorted_ary(ary,x)
	low = 0
	high = ary.length - 1
    ans = -1
	while low <=high do

		mid = (low + high)/2


		if(ary[mid] > x)
			ans = mid

			high = mid - 1
		else
			low = mid + 1
		end
	end
	ans
end

def count_occurences_sorted_ary(ary,x)
	first = first_occurences_of_sorted_ary(ary,x)
	return "#{x} Element not found" unless first >= 0
	last = last_occurences_of_sorted_ary(ary,x)
	return last - first
end



p count_occurences_sorted_ary([2, 2 , 3 , 3 , 3 , 3 , 4],3)
p count_occurences_sorted_ary([1, 1, 2, 2, 2, 2, 2, 3],2)