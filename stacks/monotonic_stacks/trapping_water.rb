# Trapping Rainwater



# 4

# Problem Statement: Given an array of non-negative integers representation elevation of ground. Your task is to find the water that can be trapped after rain .

# Examples

# Input : height = [0,1,0,2,1,0,1,3,2,1,2,1]
# Output : 6
# Explanation : Water is trapped in the dips between bars. The total trapped water units add up to 6 (1+1+2+1+1).

# Input : height = [4,2,0,3,2,5]
# Output : 9
# Explanation : The elevation map traps 9 units of water in total, as water fills the spaces between higher bars on both sides.

def trapping_water(ary)
	max_left  = 0
	max_right = 0

	total = 0
	left = 0
	right = ary.length - 1
	while left <= right do 
		if(ary[left] <= ary[right])
			if(ary[left] >= max_left)
				max_left = ary[left]
			else
				total += max_left - ary[left]
			end
			left +=1
		else
			if(ary[right] >= max_right)
				max_right = ary[right]
			else
				total += max_right - ary[right]
			end
			right -=1
		end
	end
	total
end

p trapping_water([0,1,0,2,1,0,1,3,2,1,2,1])
p trapping_water([4,2,0,3,2,5])