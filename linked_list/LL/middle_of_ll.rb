# Find middle element in a Linked List
# Problem Statement: Given the head of a linked list of integers, determine the middle node of the linked list. However, if the linked list has an even number of nodes, return the second middle node.
# Example 1:
# Input:
#  LL: 1  2  3  4  5 

class Node
	attr_accessor :value, :next

	def initialize(value,next_node:nil)
		@value = value
		@next = next_node
	end
end

class LinkedList
	attr_accessor :head, :tail

	def initialize(head:nil, tail: nil)
		@head = nil
		@tail = nil
	end

	def insert_node(value)
		new_node = Node.new(value)
		if @head
		  @tail.next = new_node
	      @tail = new_node
		else
		  @head = new_node
		  @tail = new_node
		end
	end

	def display_head
		p @head
	end

	def middle_element
		slow = @head
		fast = @head


		while fast  && fast.next
			slow = slow.next
			fast = fast.next.next
		end

		slow.value

	end
end


ll = LinkedList.new()
ll.insert_node(1)
ll.insert_node(2)
ll.insert_node(3)
ll.insert_node(4)
ll.insert_node(5)
ll.insert_node(6)
p ll.middle_element