class Solution
  def find_missing_repeating_numbers(nums)
    n = nums.length

    # Sum of first n natural numbers
    sn = (n * (n + 1)) / 2

    # Sum of squares of first n natural numbers
    s2n = (n * (n + 1) * (2 * n + 1)) / 6

    s = 0
    s2 = 0

    nums.each do |num|
      s += num
      s2 += num * num
    end

    # X - Y
    val1 = s - sn

    # X^2 - Y^2
    val2 = s2 - s2n

    # X + Y
    val2 = val2 / val1

    # Solve equations
    x = (val1 + val2) / 2   # repeating
    y = x - val1           # missing

    [x, y]
  end
end

nums = [3, 1, 2, 5, 4, 6, 7, 5]

sol = Solution.new
result = sol.find_missing_repeating_numbers(nums)

puts "The repeating and missing numbers are: {#{result[0]}, #{result[1]}}"
