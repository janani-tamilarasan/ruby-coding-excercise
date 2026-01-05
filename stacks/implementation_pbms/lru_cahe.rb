# Class representing the LRU Cache
class LRUCache

  # Node structure for Doubly Linked List
  class Node
    attr_accessor :key, :val, :prev, :next

    def initialize(key, val)
      @key = key
      @val = val
      @prev = nil
      @next = nil
    end
  end

  # Constructor
  def initialize(capacity)
    @cap = capacity
    @map = {}           # Hash for key → node

    # Dummy head & tail
    @head = Node.new(-1, -1)
    @tail = Node.new(-1, -1)

    @head.next = @tail
    @tail.prev = @head
  end

  # Add node right after head
  def add_node(node)
    temp = @head.next
    node.next = temp
    node.prev = @head
    @head.next = node
    temp.prev = node
  end

  # Delete node from list
  def delete_node(node)
    prev_node = node.prev
    next_node = node.next
    prev_node.next = next_node
    next_node.prev = prev_node
  end

  # Get value
  def get(key)
    return -1 unless @map.key?(key)

    node = @map[key]
    value = node.val

    # Move node to front
    delete_node(node)
    add_node(node)

    value
  end

  # Put key-value
  def put(key, value)
    if @map.key?(key)
      # Remove existing node
      delete_node(@map[key])
      @map.delete(key)
    end

    # If capacity full → remove LRU (tail.prev)
    if @map.size == @cap
      lru = @tail.prev
      delete_node(lru)
      @map.delete(lru.key)
    end

    # Insert new node at front
    new_node = Node.new(key, value)
    add_node(new_node)
    @map[key] = new_node
  end
end
