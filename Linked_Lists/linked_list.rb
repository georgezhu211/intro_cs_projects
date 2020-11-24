class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node 
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend(value)
    return append(value) if @head.nil?
    node = Node.new(value)
    node.next_node = @head
    @head = node
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    index.times do
      return nil if current_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    current_node = @head
    trash = nil
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    @tail = current_node
    trash = current_node.next_node
    @tail.next_node = nil
    trash
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    until current_node.nil?
      return index if current_node.value == value
      index += 1
      current_node = current_node.next_node
    end
    false
  end

  def to_s
    current_node = @head
    string = []
    until current_node.nil?
      string << "( #{current_node.value} )"
      current_node = current_node.next_node
    end
    string << 'nil'
    string.join(" -> ")
  end

  def insert_at(value, index)
    node = Node.new(value)
    current_node = at(index-1)
    node.next_node = current_node.next_node
    current_node.next_node = node
  end

  def remove_at(index)
    current_node = at(index-1)
    current_node.next_node = current_node.next_node.next_node
  end

end

class Node
  attr_writer :next_node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end

  def next_node
    @next_node
  end
end

list = LinkedList.new
list.append(100)
list.append(200)
list.append(300)
list.append(400)
list.append(500)
list.append(600)
list.append(700)
puts list
list.remove_at(3)
puts list
list.insert_at(69, 3)
puts list