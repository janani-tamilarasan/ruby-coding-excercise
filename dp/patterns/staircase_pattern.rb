
def frog_jump_using_recursion(n)
	return 0 if (n < 0)
	return 1 if (n == 0)
	frog_jump_using_recursion(n-1) + 
	frog_jump_using_recursion(n-2) + 
	frog_jump_using_recursion(n-3)
end

def frog_jump_using_meorization(n,dp_ary)
	return 0 if (n < 0)
	return 1 if (n == 0)
	return dp_ary[n] if dp_ary[n] != -1
	dp_ary[n] = frog_jump_using_meorization(n-1, dp_ary) + 
	            frog_jump_using_meorization(n-2, dp_ary) + 
	            frog_jump_using_meorization(n-3, dp_ary)
end

def frog_jump_using_tablize(n,dp_ary)
	return 0 if (n < 0)
	return 1 if (n == 0)
	dp_ary[0] = 1
	dp_ary[1] = 1
	dp_ary[2] = 2
	(3..n).each do |index|
		dp_ary[index] = (dp_ary[index - 1] + dp_ary[index - 2] + dp_ary[index - 3])
	end
	dp_ary[n]
end

n = 4
dp_ary = Array.new(n + 1).fill(-1)
p frog_jump_using_meorization(n, dp_ary)

p frog_jump_using_recursion(n)

dp_ary = Array.new(n + 1).fill(-1)
p frog_jump_using_tablize(n, dp_ary)