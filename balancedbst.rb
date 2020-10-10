class Node
  attr_accessor :value, :left, :right
  def initialize(value=nil, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end
end

class Tree
  attr_accessor :root
  def initialize(ary)
    @array = ary.uniq.sort
  end

  def build_tree
    len = @array.length
    mid = len/2
    arleft = Tree.new(@array[0..mid-1]).build_tree unless mid==0
    arright = Tree.new(@array[mid+1..len-1]).build_tree unless len==0
    @root = Node.new(@array[mid],arleft,arright)
    return @root
  end

  def insert(value)
    temp = @root
    while temp != nil && temp.value != nil do
      if value < temp.value
        prev = temp
        temp = temp.left
        l = true
      else
        prev = temp
        temp = temp.right
        l = false
      end
    end
    temp = Node.new(value)
    l ? prev.left = temp : prev.right = temp
  end
end

#=begin
ary1 = [1,4,8,3,7,1,5,2] #1 2 4 5
p ary1.uniq.sort
tree1 = Tree.new(ary1)
root = tree1.build_tree
p root.left.left.value
p root.left.value
p root.left.right.value
p root.value
p root.right.value
##################
p '-----------insert test------------'
tree1.insert(6)
p root.value #4
#p root.right.value
#p root.right.left.value
p root.right.left.right.value #6
#p root.right.left.right.left.value
p '---here==='
tree1.insert(9.0)
p root.value #4
p root.right.right.right.value #9
#=end
p '===check me==='
#tree1.insert(2.5)
ary2 = [2,5,8,15,25,35]
tree2 = Tree.new(ary2)
root = tree2.build_tree
p root.value
p root.left.value
p root.left.right.value
p root.left.right.left
tree2.insert(6)
tree2.insert(20)
tree2.insert(21)
tree2.insert(22)
p root.value #15
p root.right.left.left.right.right.value #22