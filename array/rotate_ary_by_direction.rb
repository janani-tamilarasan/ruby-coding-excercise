def rotate_ary_by_direction(arr, k , direction)
	k = k % arr.length
	direction == 'right' ? rotate_ary_by_right(arr, k) : rotate_ary_by_left(arr, k)
end

def rotate_ary_by_right(arr, k)
	len = arr.length - k
	first_part = arr.slice(0...len)
	second_part = arr.slice(len...arr.length)
	first_part.reverse!
	second_part.reverse!
	second_part.reverse! + first_part.reverse!
end

def rotate_ary_by_left(arr, k)
	first_part = arr.slice(0...k)
	second_part = arr.slice(k...arr.length)
	first_part.reverse!
	second_part.reverse!
	second_part.reverse! + first_part.reverse!
end

arr = [1, 2, 3, 4, 5, 6, 7]
k = 2
direction = 'right'
p rotate_ary_by_direction(arr, k , direction)

arr = [1, 2, 3, 4, 5, 6]
k = 2
direction = 'left'
p rotate_ary_by_direction(arr, k , direction)


# The method
# def rotate_right(arr, k)
#   k %= arr.length
#   arr[-k..-1] + arr[0...-k]
# end

# 1️⃣ k %= arr.length
# What it means
# k = k % arr.length


# This makes sure k is not bigger than the array size.

# Example
# arr = [1,2,3,4,5]
# k = 7


# Rotating right by 7 is same as rotating by:

# 7 % 5 = 2


# So we only rotate 2 times, not 7.

# ✅ This avoids unnecessary work.

# 2️⃣ arr[-k..-1]
# What does negative index mean in Ruby?

# Negative index counts from the end.

# arr = [1,2,3,4,5]
# arr[-1]  # => 5 (last element)
# arr[-2]  # => 4

# [-k..-1] means

# 👉 Take last k elements

# Example:

# arr = [1,2,3,4,5]
# k = 2

# arr[-2..-1]
# # => [4,5]

# 3️⃣ arr[0...-k]
# What does this mean?

# 👉 Take elements from index 0 up to (but not including) index -k

# Example:

# arr[0...-2]
# # => [1,2,3]

# 4️⃣ + (Array concatenation)
# [4,5] + [1,2,3]
# # => [4,5,1,2,3]


# So:

# arr[-k..-1] + arr[0...-k]


# means:

# 👉 Move last k elements to the front

# 5️⃣ Full dry run (important for interviews)
# arr = [1,2,3,4,5]
# k = 2


# Step by step:

# arr[-2..-1]   # [4,5]
# arr[0...-2]   # [1,2,3]


# Final result:

# [4,5] + [1,2,3]
# # => [4,5,1,2,3]