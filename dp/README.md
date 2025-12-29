## Dynamic Programming

### Understand /indentfy the dp problem
| Signal in DB Problem            | DP Indicator       |
| ------------------------------- | ------------------ |
| Multiple choices per row/record | Choice DP          |
| Max/Min profit, sum, cost       | Optimization DP    |
| Counting ways / combinations    | Combinatorial DP   |
| Sequential / timeline data      | LIS / Interval DP  |
| Overlapping constraints         | Memoization needed
| Try all possible ways best/count | Memoization needed

### Memorization(Memoization = recursion + cache)
  - 1. It is top down approach
  - 2. It can be used in recursively
  #### When to Use Memoization
  a) Overlapping subproblems -> Example: Fibonacci, DP on arrays, grids, strings
  b) Optimal substructure
  #### Keywords
    - maximum / minimum
	- number of ways
	- optimal solution
	- can be broken into smaller problems
	- choices at each step
	- overlapping subproblems
	- repeated recursive calls
  #### Template
    - Intialize the dp_array using Array.new(n+1).fill(-1)
    - RecursiveFn
      - Base condition
      - Return dp array if the value is already precompute
      - Assign the result to the value

```ruby
	function solve(state):
	if base_case(state):
	    return value
	if memo[state] exists:
	    return memo[state]
	result = combine(
	    solve(smaller_state_1),
	    solve(smaller_state_2),
	    ...
	)
	memo[state] = result
	return result
```
  #### TimeComplexity: 0(n)
  #### SpaceComplexity: 0(n)(recusuve stack) + 0(n) -> dp array

### Tabular Pattern(iterative DP + table)
  - 1. It is bottom up approach
  - It uses iteative and table
  #### When to Use
   - Recursion causes stack overflow

   - All subproblems must be solved anyway

   - State transitions are simple

   - You want better performance

   - You are asked to optimize space

  #### Keywords That Signal Tabulation
  “compute from 0 to n”
  “build step by step”
  “dp[i] depends on dp[i-1], dp[i-2]”
  “fill a table”

```ruby
	dp = array(size)

	dp[base_case_1] = value
	dp[base_case_2] = value

	for i from start to end:
	    dp[i] = combine(dp[previous states])

	return dp[answer_index]
```
  #### TimeComplexity: 0(n)
  #### SpaceComplexity:  0(n) -> dp array

### Space optimization
![Description](https://static.takeuforward.org/content/-3r5t408Z)
 - Each iteration’s cur_i and prev becomes the next iteration’s prev and prev2 respectively.
 - Therefore after calculating cur_i, if we update prev and prev2 according to the next step, we will always get the answer. 
 - After the iterative loop has ended we can simply return prev as our answer.

  #### TimeComplexity: 0(n)
  #### SpaceComplexity:  0(1) 

--

## Key Technique
```ruby
“Can I solve recursively
“Do subproblems repeat?”
** Identify the Recursive Problem and its base cases
** Try to represent the prroblem with indexes
** Do all possible ways on that index and find the subproblems
** Count -> sum of all ways
** min/max -> sum of all ways
```

--

## Problems

**1. Climbing Stairs**
Problem Statement:
------------------
 Given a number of stairs. Starting from the 0th stair we need to climb to the “Nth” stair. At a time we can climb either one or two steps. We need to return the total number of distinct ways to reach from 0th to Nth stair.
  Input: n = 2
  Output: 2
  Explanation: There are 2 unique ways to climb to the 2nd step:
  1. 1 step + 1 step
  2. 2 steps
  Input: n = 3
  Output: 3
  Explanation: There are 3 unique ways to climb to the 3rd step:
  1. 1 step + 1 step + 1 step
  2. 2 steps + 1 step
  3. 1 step + 2 steps

#### Solution
 same as fibonoi