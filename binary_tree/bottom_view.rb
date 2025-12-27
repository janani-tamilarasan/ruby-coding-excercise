class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def bottom_view
    return [] if root.nil?

    queue = [[root, 0]]   # [node, vertical_index]
    map = {}

    until queue.empty?
      node, line = queue.shift

      # Always overwrite → bottom-most node wins
      map[line] = node.value

      queue << [node.left, line - 1] if node.left
      queue << [node.right, line + 1] if node.right
    end

    map.keys.sort.map { |k| map[k] }
  end

  private

  def build_tree(arr)
    return nil if arr.empty? || arr[0].nil?

    root = TreeNode.new(arr[0])
    queue = [root]
    i = 1

    while i < arr.length
      current = queue.shift

      if i < arr.length && !arr[i].nil?
        current.left = TreeNode.new(arr[i])
        queue << current.left
      end
      i += 1

      if i < arr.length && !arr[i].nil?
        current.right = TreeNode.new(arr[i])
        queue << current.right
      end
      i += 1
    end

    root
  end
end
