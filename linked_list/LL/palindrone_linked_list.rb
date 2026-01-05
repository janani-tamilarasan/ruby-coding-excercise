# Node class represents a node in a linked list
class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data      # Data stored in the node
    @next = next_node # Pointer to the next node
  end
end

# Reverse a linked list using recursion
def reverse_linked_list(head)
  return head if head.nil? || head.next.nil?

  # Reverse remaining list
  new_head = reverse_linked_list(head.next)

  front = head.next
  front.next = head
  head.next = nil

  new_head
end

# Check if the linked list is a palindrome
def palindrome?(head)
  return true if head.nil? || head.next.nil?

  slow = head
  fast = head

  # Find middle of the list
  while fast.next && fast.next.next
    slow = slow.next
    fast = fast.next.next
  end

  # Reverse second half
  second_half_head = reverse_linked_list(slow.next)

  first = head
  second = second_half_head

  is_palindrome = true

  while second
    if first.data != second.data
      is_palindrome = false
      break
    end
    first = first.next
    second = second.next
  end

  # Restore original list
  slow.next = reverse_linked_list(second_half_head)

  is_palindrome
end

# Print the linked list
def print_linked_list(head)
  temp = head
  while temp
    print "#{temp.data} "
    temp = temp.next
  end
  puts
end

head = Node.new(1)
head.next = Node.new(5)
head.next.next = Node.new(2)
head.next.next.next = Node.new(5)
head.next.next.next.next = Node.new(1)

puts "Original Linked List:"
print_linked_list(head)

if palindrome?(head)
  puts "The linked list is a palindrome."
else
  puts "The linked list is not a palindrome."
end
