def find_square_root(n)
	low = 1
	high = (n/2).floor()
    ans = 0
	while low <= high do 
		mid = ((low + high)/2).floor()
		square = mid * mid
		if(square <= n)
			ans = mid
			low = mid + 1
		else
			high = mid - 1
		end
	end
	ans
end


p find_square_root(28)
p find_square_root(36)