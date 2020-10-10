class Node
  attr_accessor :value, :next_node
  def initialize
    @value = nil
    @next_node = nil
  end
  def value(value=nil)
    @value = value
  end
  def getvalue
    return @value
  end
  def getnext
    return @next_node
  end
  def next_node(next_node)
    @next_node = next_node
  end
end

class LinkedList
  @size
  @head
  @tail
  def initialize(value)
    @head = Node.new
    @head.value(value)
    @tail = @head
    @size = 1
  end

  def append(value)
    temp = Node.new
    temp.value(value)
    @tail.next_node(temp)
    @tail = temp
    @size += 1
  end

  def prepend(value)
    temp = Node.new
    temp.value(value)
    temp.next_node(@head)
    @head = temp
    @size += 1
  end

  def size
    return @size
  end

  def head
    return @head.getvalue
  end

  def tail
    return @tail.getvalue
  end

  def at(index)
    return nil if index > @size-1 || index < 0
    current = @head
    index.times do
      current = current.getnext
    end
    current.getvalue
  end

  def insert_at(value, index)
    return nil if index > @size-1 || index < 0

    temp = Node.new
    temp.value(value)
    current = @head

    (index-1).times do
      current = current.getnext
    end
    temp.next_node(current.getnext)
    current.next_node = temp
  end

  def remove_at(index)
    return nil if index > @size-1 || index < 0
    current = @head

    (index-1).times do
      current = current.getnext
    end
    current.next_node(current.getnext.getnext)
  end

  def pop
    current = @head
    (@size-2).times do
      current = current.getnext
    end
    current.next_node(nil)
    @tail = current
  end

  def contains?(value)
    current = @head
    (@size-1).times do
      return true if current.getvalue == value
      current = current.getnext
    end
    return false
  end

  def find(value)
    current = @head
    (@size-1).times do |i|
      return i if current.getvalue == value
      current = current.getnext
    end
    return nil
  end

  def to_s
    str = ''
    current = @head
    while current.getnext!=nil do
      str += "( #{current.getvalue} ) -> "
      current = current.getnext
    end
    str += "( #{current.getvalue} ) -> nil"
  end
end

linked = LinkedList.new('0')
linked.append('a')
p linked.head
p linked.tail
p linked.to_s
linked.prepend('-1')
p linked.to_s
p linked.size
p linked.at(1)
linked.pop
p linked.to_s
linked.append('r')
linked.append('s')
linked.append('z')
linked.append('123')
p linked.to_s
p linked.size
linked.append('r')
linked.append('s')
linked.append('z')
linked.append('123')
p linked.size
p 'here'
p linked.to_s
p linked.contains?('z')
p linked.contains?('123')
p linked.contains?('-1')
p linked.contains?('1223')
p linked.find('1223')
p linked.find('s')
linked.insert_at('oww',3)
p linked.to_s
linked.remove_at(5)
p linked.to_s