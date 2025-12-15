def majority_element(ary)
  count = 0
  current_ele = nil

  ary.each do |el|
    if count == 0
      current_ele = el
      count = 1
    elsif el == current_ele
      count += 1
    else
      count -= 1
    end
  end

  current_ele
end

p majority_element([7, 0, 0, 1, 7, 7, 2, 7, 7])
# => 7
