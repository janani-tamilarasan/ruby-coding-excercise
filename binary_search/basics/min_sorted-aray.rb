def find_min_sorted_array(ary)
	low = 0
	high = ary.length - 1
	while low < high do 
		mid = (low + high) / 2
        if (ary[mid] > ary[high])
            low = mid + 1;
        else
            high = mid;
        end
	end
	ary[low]
end

p find_min_sorted_array([4,5,6,7,0,1,2,3])
p find_min_sorted_array([3,4,5,1,2])