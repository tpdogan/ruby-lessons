class Node
  attr_accessor :value, :moves, :history
  def initialize(value)
    @value = value
    @moves = []
    @history = []
  end
end

class KnightMoves
  def initialize(from, to)
    @from = Node.new(from)
    @to = Node.new(to)
    @queue = [@from]
    @additions = [[-2,1],[-2,-1],[2,1],[2,-1],[-1,2],[-1,-2],[1,2],[1,-2]]
  end

  def findmoves
    loop do
      from = @queue.shift
      moves = eight(from.value)
      moves.each do |m|
        node = Node.new(m)
        node.history += from.history
        node.history.push(from.value)
        @queue.push(node)
      end
      if moves.include?(@to.value)
        finder = moves.length - moves.index(@to.value)
        return @allMoves = @queue[@queue.length-finder].history + [@to.value]
      end
    end
  end

  def eight(from)
    x = from[0]
    y = from[1]
    moves = []
    for i in @additions
      r = [x+i[0],y+i[1]]
      moves.push(r) if inside(r)
    end
    return moves
  end

  def inside(ary)
    x = ary[0]
    y = ary[1]
      if x < 8 && x > -1 && y < 8 && y > -1
        return true
      end
    return false
  end
end

m = KnightMoves.new([3,3],[4,3])
p m.findmoves