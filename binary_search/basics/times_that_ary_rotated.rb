def times_that_ary_rotated(ary)
  low = 0
  high = ary.length - 1

  while low < high
    mid = low + (high - low) / 2

    if ary[mid] > ary[high]
      low = mid + 1      # min is in right half
    else
      high = mid         # min is in left half (or mid)
    end
  end

  low
end

p times_that_ary_rotated([4,5,6,7,0,1,2,3])
