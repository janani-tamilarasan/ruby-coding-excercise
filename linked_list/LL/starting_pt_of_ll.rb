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

	def starting_pt
		slow = head
		fast = head


		while fast && fast.next
			slow = slow.next
			fast = fast.next.next
			if(slow == fast)
				slow = head
				while slow !=fast do
					slow = slow.next
					fast = fast.next
				end
				return slow.value
			end
		end
		return -1
	end
end


ll = LinkedList.new()
ll.insert_node(1)
ll.insert_node(2)
ll.insert_node(3)
ll.insert_node(4)
ll.insert_node(5)
ll.insert_node(6)

# p ll.detect_cycle(ll.head)
# create cycle: tail → node with value 3
cycle_node = ll.head.next.next
ll.tail.next = cycle_node

puts ll.starting_pt
