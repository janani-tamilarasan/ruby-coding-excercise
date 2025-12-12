

def merge(left,right)
	i = 0
	j = 0 
	result = []
	while (i < left.length && j < right.length)
		if(left[i] > right[j])
			result.push(left[i])
			i = i + 1
	    else
	    	result.push(right[j])
			j = j + 1
	    end
	end

	result + left[i..] + right[j..]
end

def merge_sort(ary)

  # Base condtion
  return ary if ary.length <= 1

  # Find mid,left, right

  mid = (ary.length / 2).floor()
  left = merge_sort(ary[0...mid])
  right = merge_sort(ary[mid...ary.length])

  # sorting
  merge(left,right)
end


ary = [4,5,1,3,2]
p merge_sort(ary)