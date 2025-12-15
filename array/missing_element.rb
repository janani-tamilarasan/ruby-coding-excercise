def missing_element(arr, n)
  sum_of_natural_numbers = n * (n + 1) / 2
  sum_of_array = arr.reduce(0) { |acc, el| acc + el }
  sum_of_natural_numbers - sum_of_array
end

p missing_element([1, 2, 4, 5], 5)  # => 3

# First: What is XOR (^)?
# XOR Rules (very important)
# a ^ a = 0
# a ^ 0 = a
# XOR is commutative (order doesn’t matter)


# 👉 Same numbers cancel each other

# 🔍 Your Problem
# Array: [1, 2, 4, 5]
# Numbers should be from: 1 to 5
# Missing number = ?

# 🔁 Code Again (for reference)
# def missing_number(arr, n)
#   xor_all = 0

#   (1..n).each { |i| xor_all ^= i }
#   arr.each { |num| xor_all ^= num }

#   xor_all
# end

# 🪜 Step-by-Step Dry Run
# Step 1: XOR all numbers from 1 to n
# xor_all = 0

# xor_all = 0 ^ 1 = 1
# xor_all = 1 ^ 2 = 3
# xor_all = 3 ^ 3 = 0
# xor_all = 0 ^ 4 = 4
# xor_all = 4 ^ 5 = 1


# After loop:

# xor_all = 1


# (Internally this is XOR of 1 ^ 2 ^ 3 ^ 4 ^ 5)

# Step 2: XOR all array elements
# xor_all = 1 ^ 1 = 0
# xor_all = 0 ^ 2 = 2
# xor_all = 2 ^ 4 = 6
# xor_all = 6 ^ 5 = 3

# 🎉 Final Result
# xor_all = 3


# ➡️ Missing number = 3

# 🤯 Why This Works (Simple Intuition)

# Every number appears twice:

# once in 1..n

# once in the array

# Same numbers cancel out (a ^ a = 0)

# Only the missing number appears once → stays

# 👉 Think of XOR as “pair cancellation”

# 🧩 Visual Explanation
# (1 ^ 2 ^ 3 ^ 4 ^ 5)
# ^ (1 ^ 2 ^    4 ^ 5)
# -------------------
# = 3

# 🎯 When to Use XOR Method

# ✔ Avoid integer overflow
# ✔ One missing number
# ✔ Numbers from 1..n
# ✔ No duplicates

# 🧠 Easy Memory Line (Interview)

# “XOR cancels matching numbers, so the remaining value is the missing number.”