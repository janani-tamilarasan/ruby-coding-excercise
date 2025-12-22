def capacity_to_ship_packages_within_D_Days(ary,days)
	low = ary.max
	high = ary.sum
	while low < high
		mid = ((low + high)/2).floor()
		possible_days  = possible?(ary,mid)
		if(possible_days <= days)
			high = mid
		else
			low = mid + 1
		end
	end
	return low
end

def possible?(ary,mid_day)
	count = 1
	total = 0
     ary.each do |el|
     	total += el
     	if(total > mid_day)
     		count +=1
     		total = el
     	end
     end
     count
end

p capacity_to_ship_packages_within_D_Days([5, 4, 5, 2, 3, 4, 5, 6], 5)