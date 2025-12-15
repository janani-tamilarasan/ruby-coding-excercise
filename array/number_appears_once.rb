def number_appears_once(ary)
	hash = {}
	ary.each do |ele|
		hash[ele] = (hash[ele] || 0) + 1
	end
	hash.select{|key,val| val == 1}.keys.first
end

p number_appears_once([4,1,2,1,2])

