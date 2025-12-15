def move_all_zeros_at_end(arr)
  l = 0

  (0...arr.length).each do |r|
    if arr[r] != 0
      arr[l], arr[r] = arr[r], arr[l]
      l += 1
    end
  end

  arr
end

p move_all_zeros_at_end([1 ,0 ,2 ,3 ,0 ,4 ,0 ,1])