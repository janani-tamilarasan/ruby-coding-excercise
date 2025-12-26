def largest_rectangle_area(heights)
  stack = []
  max_area = 0
  n = heights.length

  (0..n).each do |i|
    current_height = i < n ? heights[i] : 0

    while !stack.empty? && heights[stack[-1]] >= current_height
      height = heights[stack.pop]

      if stack.empty?
        width = i
      else
        width = i - stack[-1] - 1
      end

      max_area = [max_area, height * width].max
    end

    stack.push(i)
  end

  max_area
end

histo = [2, 1, 5, 6, 2, 3, 1]
puts "The largest area in the histogram is #{largest_rectangle_area(histo)}"
