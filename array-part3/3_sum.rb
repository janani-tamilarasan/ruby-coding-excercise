def three_sum(ary)
	output = []
	ary.sort!
	ary.each_with_index do |ele,i|
		prev = output.last
		next if i > 0 && ary[i] == ary[i - 1]
		j = i + 1
		k = ary.size - 1 
		while j < k do 
			sum = ary[i] + ary[j] + ary[k]
			k -=1 if(sum > 0)
			j +=1 if(sum < 0)
			if(sum ==0)
				output.push([ary[i],ary[j], ary[k]])
				j +=1
				k -=1
			end
		end
	end
	output
end

p three_sum([-1,0,1,2,-1,-4])