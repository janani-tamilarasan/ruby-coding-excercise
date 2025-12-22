# **Median of Two Sorted Arrays of different sizes**
# Problem Statement:
# ------------------
# Given two sorted arrays arr1 and arr2 of size m and n respectively, return the median of the two sorted arrays. The median is defined as the middle value of a sorted list of numbers. In case the length of the list is even, the median is the average of the two middle elements.

# Examples
# Input: n1 = 3, arr1[] = {2,4,6}, n2 = 3, arr2[] = {1,3,5}
# Output: 3.5
# Explanation: 
# The array after merging 'a' and 'b' will be {1, 2, 3, 4, 5, 6}. As the length of the merged list is even, the median is the average of the two middle elements. Here two medians are 3 and 4. So the median will be the average of 3 and 4, which is 3.5.
# Input: n1 = 3, arr1[] = {2,4,6}, n2 = 2, arr2[] = {1,3}
# Output: 3
# Explanation: 
# The array after merging 'a' and 'b' will be { 1, 2, 3, 4, 6 }. The median is 3.

def median_of_sorted_array(arr1, arr2)
  # Ensure arr1 is the smaller array
  return median_of_sorted_array(arr2, arr1) if arr1.length > arr2.length

  n1 = arr1.length
  n2 = arr2.length
  low = 0
  high = n1

  while low <= high
    cut1 = (low + high) / 2
    cut2 = (n1 + n2 + 1) / 2 - cut1

    l1 = cut1 == 0 ? -Float::INFINITY : arr1[cut1 - 1]
    l2 = cut2 == 0 ? -Float::INFINITY : arr2[cut2 - 1]
    r1 = cut1 == n1 ? Float::INFINITY : arr1[cut1]
    r2 = cut2 == n2 ? Float::INFINITY : arr2[cut2]

    if l1 <= r2 && l2 <= r1
      if (n1 + n2).even?
        return ([l1, l2].max + [r1, r2].min) / 2.0
      else
        return [l1, l2].max
      end
    elsif l1 > r2
      high = cut1 - 1
    else
      low = cut1 + 1
    end
  end

  0.0
end

p median_of_sorted_array([2,4,6], [1,3])    # => 3


p median_of_sorted_array([2,4,6],[1,3,5])