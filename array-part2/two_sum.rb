# Two Sum : Check if a pair with given sum exists in Array
# Problem Statement: 
# Given an array of integers arr[] and an integer target.Return indices of the two numbers such that their sum is equal to the target. Otherwise, we will return {-1, -1}.

# Examples

# Input: N = 5, arr[] = {2,6,5,8,11}, target = 14
# Output : [1,3]
# Explanation: arr[1] + arr[3] = 14. So, output will be : [1,3].

# Input: N = 5, arr[] = {2,6,5,8,11}, target = 15
# Output : [-1,-1].
# Explanation: There exist no such two numbers whose sum is equal to the target. 

  ###################### Algorithm 1:(USING HASHING)
def two_sum(ary,target)
	hash = {}
	ary.each_with_index do |ele,index|
		needed_ele = target - ele
		return [hash[needed_ele], index] if(hash[needed_ele])
		hash[ele] = index
	end
	return [-1,-1]
end

ary = [2,6,5,8,11]
target = 14
p two_sum(ary,target)

######################## END ###########

###################### Algorithm 2:((SORTING + TWO POINTER)

def two_sum_using_two_pointer(nums, target)
  nums_with_index = nums.map.with_index { |val, idx| [val, idx] }
  nums_with_index.sort_by! { |x| x[0] }

  l = 0
  r = nums_with_index.length - 1

  while l < r
    sum = nums_with_index[l][0] + nums_with_index[r][0]

    if sum == target
      return [nums_with_index[l][1], nums_with_index[r][1]]
    elsif sum > target
      r -= 1
    else
      l += 1
    end
  end

  [-1, -1]
end

ary = [2, 6, 5, 8, 11]
target = 15
p two_sum_using_two_pointer(ary, target)
