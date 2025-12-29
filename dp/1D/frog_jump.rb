def frog_jump_using_meorization(n,dp_ary)
	return 0 if (n < 0)
	return 1 if (n == 0)
	return dp_ary[n] if dp_ary[n] != -1
	dp_ary[n] = frog_jump(n-1, dp_ary) + frog_jump(n-2, dp_ary) + frog_jump(n-3, dp_ary)
end

n = 4
dp_ary = Array.new(n + 1).fill(-1)
p frog_jump(n, dp_ary)