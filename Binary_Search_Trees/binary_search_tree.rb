# Node Class
class Node
  include Comparable
  attr_accessor :data, :left, :right
  def initialize(data=nil, left=nil, right=nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other)
    self.data <=> other.data
  end
end

# Tree Class
class Tree
  def initialize(arr)
    arr = arr.sort.uniq
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.empty?
    mid = arr.length / 2
    data = arr[mid]
    left = build_tree(arr[0...mid])
    right = build_tree(arr[mid+1..-1])
    Node.new(data, left, right)
  end

  def insert(value, current_node=@root)
    new_node = Node.new(value)
    case new_node <=> current_node
    when -1
      if current_node.left.nil?
        current_node.left = new_node
      else
        insert(value, current_node.left)
      end
    when 1
      if current_node.right.nil?
        current_node.right = new_node
      else
        insert(value, current_node.right)
      end
    when 0
      puts "That value already exist."
      return false
    end
  end

  def delete(value, current_node=@root)
    delete_node = Node.new(value)
    case delete_node <=> current_node
    when -1
      current_node.left = delete(value, current_node.left)
    when 1
      current_node.right = delete(value, current_node.right)
    when 0
      case count_child(current_node)
      when 0
        return nil
      when 1
        return current_node.left.nil? ? current_node.right : current_node.left
      when 2
        temp = find_min(current_node.right)
        current_node.data = temp.data
        current_node.right = delete(temp.data, current_node.right)
      end
    end
    current_node
  end

  def find_min(node)
    if node.left.nil?
      return node
    else
      find_min(node.left)
    end
  end

  def count_child(node)
    if node.left.nil? && node.right.nil?
      return 0
    elsif node.left.nil? || node.right.nil?
      return 1
    else
      return 2
    end   
  end

  def find(value)
    queue = [@root]
    until queue.empty?
      current = queue.pop
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
      return current if current.data == value
    end
    false
  end

  def height(node=@root)
    return -1 if node.nil?
    left_height = height(node.left)
    right_height = height(node.right)
    return [left_height, right_height].max + 1
  end

  def depth(node, current_node=@root, depth=0)
    return 0 if current_node.nil?
    return depth if node == current_node
    depth+=1
    left_depth = depth(node, current_node.left, depth)
    right_depth = depth(node, current_node.right, depth)
    return [left_depth, right_depth].max
  end


  # Binary Tree Traversal

  def level_order
    read = []
    queue = [@root]
    until queue.empty?
      current = queue.first
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
      read << queue.shift
    end
    read.map { |node| node.data }
  end

  def preorder(node=@root, arr=[])
    return if node.nil?
    arr << node.data
    preorder(node.left, arr)
    preorder(node.right, arr)
    arr if node == @root
  end

  def inorder(node=@root, arr=[])
    return if node.nil?
    arr << node.data
    inorder(node.left, arr)
    inorder(node.right, arr)
    arr if node == @root
  end

  def postorder(node=@root, arr=[])
    return if node.nil?
    postorder(node.left, arr)
    postorder(node.right, arr)
    arr << node.data
    arr if node == @root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

arr = [1,3,5,7,9,11,13]

tree = Tree.new(arr)
tree.insert(2)
tree.pretty_print
node = tree.find(7)
puts tree.height(node)
puts tree.depth(node)