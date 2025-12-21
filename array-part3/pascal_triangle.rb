# Write a program to generate Pascal's triangle. In Pascal’s triangle, each number is the sum of the two numbers directly above it as shown in the figure below:

# 	Input: N = 5, r = 5, c = 3 
# 	Output: Element at position (r, c): 6
# 	N-th row of Pascal’s triangle: 1 4 6 4 1
# 	First n rows of Pascal’s triangle:
# 	1 
# 	1 1 
# 	1 2 1 
# 	1 3 3 1 
# 	1 4 6 4 1  
# 	Explanation: Pascal triangle for first 5 rows is shown above.
# 	Input: N = 1, r = 1, c = 1
# 	Output: Element at position (r, c): 1
# 	N-th row of Pascal’s triangle: 1
# 	First n rows of Pascal’s triangle:
# 	1  
# 	Explanation: N = 1 is the base case fof a pascal's triangle.


def find_element_at_position(r,c)
	n = r - 1 
	k =  c - 1
	result = 1
	(0...k).each do |index|
		result *= (n-index)
		result /= (index + 1)
	end
    result
end


def find_nth_row(r)
	n = r - 1 
	result = 1
	output = [1]
	(0...n).each do |index|
		result *= (n-index)
		result /= (index + 1)
		output.push(result)
	end
     output.join(' ')
end

def print_whole_pascal(r)
		n = r - 1 
		result =  1
	
	(0..n).each do |index|
		row = index + 1
		output = [1]
		(0..index).each do |index_1|
			result *= (row-index_1)
			result /= (index_1 + 1)
			output.push(result)
		end
		p output.join(' ')
	end
     
end

p "The element at position of #{find_element_at_position(5,3)}"
p "nth row of #{find_nth_row(5)}" 
p "print_whole_pascal #{print_whole_pascal(5)}" 