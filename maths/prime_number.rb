

# CHECK IF GIVEN NUMBER IS PRIME OR NOT
def is_prime_number(num)
	flag = true
	return 'Not Prime Number' if num < 2
	(2...Math.sqrt(num)).each do |i|

		flag = false if(mod(num,i))
        quotient = num / i 
		flag = false if(mod(quotient,i) && quotient != i)
	end
	flag ? "Prime Number" : 'Not Prime Number'
end

def mod(num,i)
	num % i == 0
end

p is_prime_number(36)

#---------------------------------END----------------------------------

# DISPLAY THE PRIME NUMBERS FROM 1 to n
def diplay_prime_numbers(n)
	prime_numbers = []
	(2..n).each do |num|
		
		flag = true
		(2..Math.sqrt(num)).each do |i|
		  if(num % i == 0)
		  	flag = false
		  end
		end
		flag && prime_numbers.push(num)
	end
	"There are #{prime_numbers.join(',')} are present"
end

p diplay_prime_numbers(36)

#---------------------------------END----------------------------------

# DISPLAY NEXT PRIME NUMBER OF GIVEN NUM

def find_next_prime_number(num)
	next_num = num + 1
	while next_num do
		flag = true
		(2..Math.sqrt(next_num)).each do |i|
			flag = false if(next_num % i == 0)
		end
		if(flag)
			return "The next num of #{num} is #{next_num}"
		else
			next_num = next_num + 1
		end
	end
end

p find_next_prime_number(7)
#---------------------------------END----------------------------------


