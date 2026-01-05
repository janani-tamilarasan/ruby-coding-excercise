# Node definition for singly-linked list
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class Solution
  # Function to segregate even and odd nodes
  def segregate_even_odd(head)
    return head if head.nil? || head.next.nil?

    even_head = even_tail = nil
    odd_head  = odd_tail  = nil

    current = head

    while current
      if current.data.even?
        if even_head.nil?
          even_head = even_tail = current
        else
          even_tail.next = current
          even_tail = current
        end
      else
        if odd_head.nil?
          odd_head = odd_tail = current
        else
          odd_tail.next = current
          odd_tail = current
        end
      end

      current = current.next
    end

    return odd_head if even_head.nil?
    return even_head if odd_head.nil?

    even_tail.next = odd_head
    odd_tail.next = nil

    even_head
  end
end
