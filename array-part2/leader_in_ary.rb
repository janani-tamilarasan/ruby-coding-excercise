def leader_in_ary(ary)
	max = 0
	result = []
	r = ary.length - 1
	while r >=0 do
		if(ary[r] > max)
			max = ary[r]
			result.push(ary[r])
		end
		r -=1
	end
	result
end

p leader_in_ary([10, 22, 12, 3, 0, 6])