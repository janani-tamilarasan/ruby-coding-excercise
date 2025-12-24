class Solution
  # Function to find the single non-duplicate element
  def single_non_duplicate(arr)
    n = arr.length

    # Edge case: only one element
    return arr[0] if n == 1

    # Edge case: first element is unique
    return arr[0] if arr[0] != arr[1]

    # Edge case: last element is unique
    return arr[n - 1] if arr[n - 1] != arr[n - 2]

    low = 1
    high = n - 2

    while low <= high
      mid = (low + high) / 2

      # Check if mid is the unique element
      if arr[mid] != arr[mid - 1] && arr[mid] != arr[mid + 1]
        return arr[mid]
      end

      # Check if we are in the valid pairing half
      if (mid.odd? && arr[mid] == arr[mid - 1]) ||
         (mid.even? && arr[mid] == arr[mid + 1])
        low = mid + 1
      else
        high = mid - 1
      end
    end

    -1
  end
end

# Driver code
arr = [1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6]

obj = Solution.new
ans = obj.single_non_duplicate(arr)

puts "The single element is: #{ans}"
