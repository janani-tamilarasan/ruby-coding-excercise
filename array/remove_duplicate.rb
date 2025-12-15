def remove_duplicate(arr)
  return arr if arr.empty?

  l = 0
  r = 1

  while r < arr.length
    if arr[l] != arr[r]
      l += 1
      arr[l] = arr[r]
    end
    r += 1  
  end

  arr[0..l]
end

p remove_duplicate([1,1,2,2,2,3,3,4])
