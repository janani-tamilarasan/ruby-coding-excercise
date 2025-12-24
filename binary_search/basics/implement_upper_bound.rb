def implement_lower_bound(ary,x)
  low = 0
  high = ary.length - 1
  ans = -1
  while low <= high do
  	mid = (low+high)/2
  	if(ary[mid] > x)
  		ans = mid
  		high = mid -1
  	else
  		low = mid + 1
  	end
  end
  ans
end

p implement_lower_bound([3,5,8,15,19],9)