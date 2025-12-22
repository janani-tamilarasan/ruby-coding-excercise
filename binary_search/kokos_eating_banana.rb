def kokos_eating_bananas(ary,h)
	low = 1
	high = ary.max()
	ans = high
	while low <= high do 
      mid = ((low+high)/2).floor()
      total_hours = calcualte_total_hours(ary,mid)
      if(total_hours <=h)
      	ans = mid
      	high = mid - 1
      else
      	low = mid + 1
      end
	end
	ans
end

def calcualte_total_hours(ary,mid)
	total_hours = 0
	ary.each do |el|
		total_hours += (el.to_f/mid).ceil()
	end
	total_hours
end

ary = [7, 15, 6, 3]
h = 8
p kokos_eating_bananas(ary,h)