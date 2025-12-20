######################### BETTER_APPROACH ->(using current Algorithm) #####################
def longest_consecutive(ary)
	ary.sort!
	last_smaller = -Float::INFINITY
	max_longest =  1
	count = 0
	ary.each_with_index do |el, index|
		if((el - 1) == last_smaller)
			count +=1
		else
			count = 1
		end
		last_smaller = el
		max_longest =[max_longest,count].max()
	end
	max_longest
end

p longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])

######################## END ################################################
######################### OPTIMAL APPROACH ->(using HASH compare) #####################
def longest_consecutive_with_hash(arr)
  set = {}
  arr.each { |num| set[num] = true }

  max_len = 0

  arr.each do |num|
    # start only if it's the beginning of a sequence
    if !set[num - 1]
      current_num = num
      count = 1

      while set[current_num + 1]
        current_num += 1
        count += 1
      end

      max_len = [max_len, count].max
    end
  end

  max_len
end

p longest_consecutive_with_hash([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])
# => 9
