def count_char(str)
	str_hash = {}
	str.each_char do |ch|
		next if ch == ' '
		ch_lower = ch.downcase()
		str_hash[ch_lower] = (str_hash[ch_lower] || 0) + 1
	end
	str_hash.keys.length
end

p count_char('Hello world')

p "Hello world".delete(' ').chars.tally.keys.length
