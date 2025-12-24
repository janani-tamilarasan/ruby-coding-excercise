def search_insert_pos(ary,x)
  low = 0
  high = ary.length
  while low < high do
  	mid = (low + high)/2
  	if ary[mid] == x
  		return "#{x} is available at #{mid} index and so no insertion taken place"
  	elsif(ary[mid] < x)
  		low = mid + 1
  	else
  		high = mid - 1
  	end
  end
  low
end

p search_insert_pos([1, 2, 4, 7],6)

p search_insert_pos([1, 2, 4, 7],7)