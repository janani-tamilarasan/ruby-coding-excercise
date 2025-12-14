def second_largest(ary)
	second_max = ary[0]
	max = ary[0]
	(1...ary.length).each do |index|
		if(ary[index] > max)
			second_max = max
			max = ary[index]
		elsif(ary[index] >  second_max && ary[index] != max)
			second_max = ary[index]
		end
	end
	second_max
end

p second_largest([5,6,2,6,4,1,3])