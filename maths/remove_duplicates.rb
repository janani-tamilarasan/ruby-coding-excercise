def remove_duplicates(ary)
	ary_hash = {}

	ary.each do |el|
		ary_hash[el] = (ary_hash[el] || 0) + 1
	end
    ary_hash.keys
end

p remove_duplicates([1,2,3,2,3,4])

p 'Using BuiltIn with Uniq'
p [1,2,3,2,3,4].uniq!