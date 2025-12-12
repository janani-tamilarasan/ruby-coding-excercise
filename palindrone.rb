################# WITHOUT USIGNG BUILT IN ##############
def palindrone(num)
	actual_num  = num
	reversed_num = 0
	while num > 0
		last_digit = num % 10
		reversed_num = reversed_num * 10 + last_digit
		num = num/10
	end
    reversed_num ==  actual_num ? 'Palindrone' : 'Not Palindrone'
end

p palindrone(121)
######################## END ##################
################# USIGNG BUILT IN ##############
p 121.to_s == 121.to_s.reverse! ? 'Palindrone' : 'Not Palindrone'