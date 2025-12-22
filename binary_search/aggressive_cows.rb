def aggressive_cows(arr, k)
  arr.sort!
  low = 1
  high = arr[-1] - arr[0]
  ans = 0

  while low <= high
    mid = (low + high) / 2

    if can_place?(arr, mid, k)
      ans = mid          # feasible → try bigger distance
      low = mid + 1
    else
      high = mid - 1     # not feasible → reduce distance
    end
  end

  ans
end

def can_place?(arr, dist, k)
  count = 1
  last_pos = arr[0]

  arr.each do |pos|
    if pos - last_pos >= dist
      count += 1
      last_pos = pos
    end
  end

  count >= k
end


p aggressive_cows([0,3,4,7,10,9],4)
p aggressive_cows([4,2,1,3,6],2)