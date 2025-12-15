def max_consecutive_ones(arr)
  max_count = 0
  count = 0

  arr.each do |num|
    if num == 1
      count += 1
      max_count = [count, max_count].max
    else
      count = 0
    end
  end

  max_count
end

prices = [1, 1, 0, 1, 1, 1]
p max_consecutive_ones(prices)
