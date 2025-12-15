#Longest Subarray with given Sum K(Positives)
def longest_subarray_sum(ary, k)
  max_len = 0
  sum = 0
  l = 0

  (0...ary.length).each do |r|
    sum += ary[r]

    while sum > k
      sum -= ary[l]
      l += 1
    end

    if sum == k
      max_len = [max_len, r - l + 1].max
    end
  end

  max_len
end

ary = [1,2,3,1,1,1,1,3,3]
p longest_subarray_sum(ary, 6)   # => 4
