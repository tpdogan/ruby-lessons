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
    arright = Tree.new(@array[mid+1..len-1]).build_tree unless len==mid+1
    @root = Node.new(@array[mid],arleft,arright)
    return @root
  end

  def insert(value)
    temp = @root
    while temp != nil do
      return 'Value exists!' if value == temp.value
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
    @array = @array.push(value).sort
    temp = Node.new(value)
    l ? prev.left = temp : prev.right = temp
    return 'Value inserted.'
  end

  def delete(value)
    exist = @array.index(value)
    if exist
      @array = @array - [value]
      temp = Tree.new(@array)
      root = temp.build_tree
      @root.value = root.value
      @root.left = root.left
      @root.right = root.right
      p "#{value} is deleted and tree is rebalanced"
    else
      p 'Node does not exist'
    end
  end

  def find(value)
    temp = @root
    while temp != nil do
      if value == temp.value
        return temp
      elsif value < temp.value
        temp = temp.left
      elsif value > temp.value
        temp = temp.right
      end
    end
    return nil
  end

  def level_order(currentRoot=@root)
    if currentRoot==nil
      return
    end
    if currentRoot==@root
      @queue = [@root]
      @levelorder = []
    end

    while !@queue.empty? do
      temp = @queue.shift
      @levelorder.push(temp.value)
      @queue.push(temp.left) unless temp.left == nil
      @queue.push(temp.right) unless temp.right == nil
    end
    return @levelorder
  end

  def inorder(currentRoot=@root)
    if currentRoot==nil
      return
    end
    if currentRoot==@root
      @inorder = []
    end
    inorder(currentRoot.left)
    @inorder.push(currentRoot.value)
    inorder(currentRoot.right)
    return @inorder
  end

  def preorder(currentRoot=@root)
    if currentRoot==nil
      return
    end
    if currentRoot==@root
      @preorder = []
    end
    @preorder.push(currentRoot.value)
    preorder(currentRoot.left)
    preorder(currentRoot.right)
    return @preorder
  end

  def postorder(currentRoot=@root)
    if currentRoot==nil
      return
    end
    if currentRoot==@root
      @postorder = []
    end
    postorder(currentRoot.left)
    postorder(currentRoot.right)
    @postorder.push(currentRoot.value)
    return @postorder
  end

  def height(node=@root)
    temp = @root
    value = node.value
    while temp != node do
      if temp == nil
        return 'Node does not exist'
      elsif value < temp.value
        temp = temp.left
      elsif value > temp.value
        temp = temp.right
      end
    end

    height = 1
    level = [temp]
    levelCopy = []
    while !level.empty? do
      level.each do |n|
        levelCopy.push(n.left) unless n.left == nil
        levelCopy.push(n.right) unless n.right == nil
      end
      return height if levelCopy.empty?
      height += 1
      level = levelCopy
      levelCopy = []
    end
  end

  def depth(node=@root)
    depth = 1
    temp = @root
    value = node.value
    while temp != node do
      if temp == nil
        return 'Node does not exist'
      elsif value < temp.value
        temp = temp.left
      elsif value > temp.value
        temp = temp.right
      elsif node.value == temp.value
        return 'Same value but different node'
      end
      depth += 1
    end
    return depth
  end

  def balanced?(node=@root)
    if node==nil
      return
    end
    if node==@root
      @queue = [@root]
    end

    while !@queue.empty? do
      temp = @queue.shift

      temp.left != nil ? hl = height(temp.left) : hl = 0
      temp.right != nil ? hr = height(temp.right) : hr = 0
      delta = hl - hr
      return false if delta > 1 || delta < -1
      @queue.push(temp.left) unless temp.left == nil
      @queue.push(temp.right) unless temp.right == nil
    end
    return true
  end

  def rebalance
    temp = Tree.new(@array)
    root = temp.build_tree
    @root.value = root.value
    @root.left = root.left
    @root.right = root.right
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

ary = Array.new(15) { rand(1..100) }
tree = Tree.new(ary)
root = tree.build_tree
p tree.balanced?
p tree.level_order
p tree.preorder
p tree.inorder
p tree.postorder
tree.insert(110)
tree.insert(120)
tree.insert(130)
p tree.balanced?
tree.rebalance
p tree.balanced?
p tree.level_order
p tree.preorder
p tree.inorder
p tree.postorder
tree.delete(110)
p tree.inorder
tree.pretty_print
=begin all test
ary1 = [1,4,8,3,7,1,5,2] #1 2 4 5
p ary1.uniq.sort
tree1 = Tree.new(ary1)
root = tree1.build_tree
#=begin
p root.left.left.value
p root.left.value
p root.left.right.value
p root.value
p root.right.value
##################
p '-----------insert test------------'
tree1.insert(6)
nod1 = tree1.find(4)
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
p tree2.insert(21)
qnode = tree2.find(21)
p qnode.value
p qnode.right.value
#=end
p '----levelorder----'
ary3 = [2,5,8,15,25,30,35]
#ary3 = [1,2,3]
tree3 = Tree.new(ary3)
root = tree3.build_tree
p tree3.level_order
p tree3.level_order
p '----inorder----'
p tree3.inorder
p tree3.inorder
p tree3.preorder
p tree3.preorder
p tree3.postorder
p tree3.postorder
p '====height===='
nod = tree3.find(30)
p tree3.height(nod)
#p root.right.left.left
p tree3.insert(21)
#p root.right.left.left.right
p tree3.height(nod)
p tree3.depth(nod)
nod = tree3.find(21)
p tree3.depth(nod)
p '--------------------'
p nod1.value
p tree3.depth(nod1)
p tree3.balanced?
p tree3.insert(22)
p tree3.balanced?
p '*********************'
tree3.rebalance
p root.value
p root.right.left.left.value
=end