# **K-th Element of two sorted arrays**
# Problem Statement:
# ------------------
#  Given two sorted arrays a and b of size m and n respectively. Find the kth element of the final sorted array.
#  Example 1:
# Input:
#  a = [2, 3, 6, 7, 9], b = [1, 4, 8, 10], k = 5  
# Output:
#  6  
# Explanation:
#  The final sorted array would be [1, 2, 3, 4, 6, 7, 8, 9, 10]. The 5th element of this array is 6.

# Example 2:
# Input:
#  a = [100, 112, 256, 349, 770], b = [72, 86, 113, 119, 265, 445, 892], k = 7  
# Output:
#  256  
# Explanation:
#  The final sorted array is [72, 86, 100, 112, 113, 119, 256, 265, 349, 445, 770, 892]. The 7th element of this array is 256.


def kth_element_sorted_ary(ary1, ary2, k)
  # Ensure ary1 is the smaller array
  return kth_element_sorted_ary(ary2, ary1, k) if ary1.length > ary2.length

  m = ary1.length
  n = ary2.length

  low = 0
  high = ary1.length

  while low <= high
    cut1 = (low + high) / 2
    cut2 = k - cut1

    l1 = cut1 == 0 ? -Float::INFINITY : ary1[cut1 - 1]
    l2 = cut2 == 0 ? -Float::INFINITY : ary2[cut2 - 1]
    r1 = cut1 == m ? Float::INFINITY : ary1[cut1]
    r2 = cut2 == n ? Float::INFINITY : ary2[cut2]

    if l1 <= r2 && l2 <= r1
      return [l1, l2].max
    elsif l1 > r2
      high = cut1 - 1
    else
      low = cut1 + 1
    end
  end

  -1
end

p kth_element_sorted_ary(
  [100, 112, 256, 349, 770],
  [72, 86, 113, 119, 265, 445, 892],
  7
)
# => 256

p kth_element_sorted_ary(
  [2, 3, 6, 7, 9],
  [1, 4, 8, 10],
  5
)
# => 6
