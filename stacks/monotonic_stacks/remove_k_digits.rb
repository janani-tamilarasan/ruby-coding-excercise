# **Remove K Digits**
# Problem Statement:
# ------------------
#  Given a string nums representing a non-negative integer, and an integer k, find the smallest possible integer after removing k digits from num.
#  Example 1:
# Input:
#  nums = "541892", k = 2
# Output:
#  "1892"
# Explanation:
#  Removing the two digits 5 and 4 yields the smallest number, 1892.

# Example 2:
# Input:
#  nums = "1002991", k = 3
# Output:
#  "21"
# Explanation:
#  Remove the three digits 1(leading one), 9, and 9 to form the new number 21(Note that the output must not contain leading zeroes) which is the smallest.

def remove_k_digits(num, k)
  stack = []

  num.each_char do |digit|
    while !stack.empty? && k > 0 && stack[-1] > digit
      stack.pop
      k -= 1
    end
    stack.push(digit)
  end

  # Remove remaining digits
  while k > 0
    stack.pop
    k -= 1
  end

  # Remove leading zeros
  result = stack.join.sub(/^0+/, '')
  result.empty? ? "0" : result
end

p remove_k_digits("541892", 2)
p remove_k_digits("1432219", 3)
p remove_k_digits("1002991", 3)
