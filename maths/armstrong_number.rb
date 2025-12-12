def armstrong_number(num)
	actual_num  = num
	sum = 0
	while num > 0 do
		last_digit = num % 10
		power = last_digit ** actual_num.digits.length
		sum += power
		num = (num/10).floor()
	end
	sum == actual_num ? 'Armstorng Numer' : "Not Armstorng number"
end

p armstrong_number(153)

p 'Uisng Builtin'
actual_num = 153
total = actual_num.digits.reduce(0) do |sum,num|
  sum + (num ** actual_num.digits.length)
end
p total == actual_num ? 'Armstorng Numer' : "Not Armstorng number"