def largest_ele(ary)

	max = ary[0]
	(1...ary.length).each do |el|
		if(ary[el] > max)
			max = ary[el]
		end
	end
	max
end

p largest_ele([5,6,2,4,1,3])