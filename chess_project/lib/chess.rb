class Chess
  attr_reader :table
  def createTable
    @table = Array.new(64,'')
  end

  def addPieces
    wpa = "\u2659 ".encode("utf-8")
    wkn = "\u2658 ".encode("utf-8")
    wbi = "\u2657 ".encode("utf-8")
    wro = "\u2656 ".encode("utf-8")
    wqu = "\u2655 ".encode("utf-8")
    wki = "\u2654 ".encode("utf-8")
    bpa = "\u265F ".encode("utf-8")
    bkn = "\u265E ".encode("utf-8")
    bbi = "\u265D ".encode("utf-8")
    bro = "\u265C ".encode("utf-8")
    bqu = "\u265B ".encode("utf-8")
    bki = "\u265A ".encode("utf-8")

    # Adding white pieces
    @table[8..15] = Array.new(8,wpa)
    @table[0] = wro; @table[7] = wro
    @table[1] = wkn; @table[6] = wkn
    @table[2] = wbi; @table[5] = wbi
    @table[3] = wqu; @table[4] = wki

    # Adding black pieces
    @table[48..55] = Array.new(8,bpa)
    @table[56] = bro; @table[63] = bro
    @table[57] = bkn; @table[62] = bkn
    @table[58] = bbi; @table[61] = bbi
    @table[59] = bqu; @table[60] = bki
  end

  def display
    color = 0
    (1..8).each do |row|
      (0..7).each do |col|
        print `tput setab #{color};`
        if @table[(row-1)*8 + col] == ''
          print '  '
        else
          print @table[(row-1)*8 + col]
        end
        color == 0 ? color = 8 : color = 0
      end
      color == 0 ? color = 8 : color = 0
      print `tput sgr #{0};`
      puts
    end
  end

  def inTable?(from, to)
    if from.length == 2 && to.length == 2 &&
       (1..8).include?(from[0]) && (1..8).include?(from[1]) &&
       (1..8).include?(to[0]) && (1..8).include?(to[1])
       return true
    end
    return false
  end

  def arrayToTable(ary)
    return ary[0]-1 + (ary[1]-1)*8
  end

  def isChessman?(ary)
    return true if @table[arrayToTable(ary)] != ''
    return false
  end

  def whichChessman(ary)
    piece = @table[arrayToTable(ary)]
    if ["\u2659 ".encode("utf-8"), "\u265F ".encode("utf-8")].include?(piece)
      return "pawn"
    elsif ["\u2658 ".encode("utf-8"), "\u265E ".encode("utf-8")].include?(piece)
      return "knight"
    elsif ["\u2657 ".encode("utf-8"), "\u265D ".encode("utf-8")].include?(piece)
      return "bishop"
    elsif ["\u2656 ".encode("utf-8"), "\u265C ".encode("utf-8")].include?(piece)
      return "rock"
    elsif ["\u2655 ".encode("utf-8"), "\u265B ".encode("utf-8")].include?(piece)
      return "queen"
    elsif ["\u2654 ".encode("utf-8"), "\u265A ".encode("utf-8")].include?(piece)
      return "king"
    else
      return "none"
    end
  end

  def getColor(ary)
    whiteList = ["\u2659 ".encode("utf-8"), "\u2658 ".encode("utf-8"), "\u2657 ".encode("utf-8"), "\u2656 ".encode("utf-8"), "\u2655 ".encode("utf-8"), "\u2654 ".encode("utf-8")]
    blackList = ["\u265F ".encode("utf-8"), "\u265E ".encode("utf-8"), "\u265D ".encode("utf-8"), "\u265C ".encode("utf-8"), "\u265B ".encode("utf-8"), "\u265A ".encode("utf-8")]
    return 'white' if whiteList.include?(@table[arrayToTable(ary)])
    return 'black' if blackList.include?(@table[arrayToTable(ary)])
    return 'none'
  end

  def canMove?(piece, from, to)
    to[0] == from[0] ? dx = 0 : dx = (to[0] - from[0])/(to[0] - from[0]).abs
    to[1] == from[1] ? dy = 0 : dy = (to[1] - from[1])/(to[1] - from[1]).abs

    if piece == "pawn"
      if dx == 0 && (to[1]-from[1]).abs == 1
        isChessman?(to) ? (return false) : (return true)
      elsif dx == 0 && (to[1]-from[1]).abs == 2
        other = [from[0], from[1] + dy]
        (isChessman?(to) || isChessman?(other)) ? (return false) : (return true)
      elsif dx != 0 && isChessman?(to)
        getColor(to) == getColor(from) ? (return false) : (return true)
      end

    elsif piece == "knight"
      getColor(to) == getColor(from) ? (return false) : (return true)

    elsif piece == "bishop"
      (dx.abs - 1).times do
        return false if isChessman?([from[0]+dx, from[1]+dy])
      end
      getColor(to) == getColor(from) ? (return false) : (return true)

    elsif piece == "rock"
      delta = to[0] + to[1] - from[0] - from[1]
      (delta.abs - 1).times do
        return false if isChessman?([from[0]+dx, from[1]+dy])
      end
      getColor(to) == getColor(from) ? (return false) : (return true)

    elsif piece == "queen"
      ((to[0] - from[0]).abs - 1).times do
        return false if isChessman?([from[0]+dx, from[1]+dy])
      end
      getColor(to) == getColor(from) ? (return false) : (return true)

    elsif piece == "king"
      ((to[0] - from[0]).abs - 1).times do
        return false if isChessman?([from[0]+dx, from[1]+dy])
      end
      getColor(to) == getColor(from) ? (return false) : (return true)
    end
    return false
  end

  def movePiece?(from, to)
    piece = whichChessman(from)
    color = getColor(from)
    pos1 = arrayToTable(from)
    pos2 = arrayToTable(to)
    if piece == "pawn"
      if isPawnMove?(color, from, to) && canMove?(piece, from, to)
        @table[pos2] = @table[pos1]
        @table[pos1] = ''
        return true
      end
    elsif piece == "knight"
      if isKnightMove?(from, to) && canMove?(piece, from, to)
        @table[pos2] = @table[pos1]
        @table[pos1] = ''
        return true
      end
    elsif piece == "bishop"
      if isBishopMove?(from, to) && canMove?(piece, from, to)
        @table[pos2] = @table[pos1]
        @table[pos1] = ''
        return true
      end
    elsif piece == "rock"
      if isRockMove?(from, to) && canMove?(piece, from, to)
        @table[pos2] = @table[pos1]
        @table[pos1] = ''
        return true
      end
    elsif piece == "queen"
      if isQueenMove?(from, to) && canMove?(piece, from, to)
        @table[pos2] = @table[pos1]
        @table[pos1] = ''
        return true
      end
    elsif piece == "king" && canMove?(piece, from, to)
      if isKingMove?(from, to)
        @table[pos2] = @table[pos1]
        @table[pos1] = ''
        return true
      end
    end
    return false
  end

  def isPawnMove?(color, from, to, eat=false)
    if inTable?(from, to)
      if color == 'white'
        if [from[0]-1, from[0], from[0]+1].include?(to[0]) && to[1] == from[1]+1
          return true
        elsif from[1] == 2 && to[1] == 4 && from[0] == to[0]
          return true
        end
      elsif color == 'black'
        if [from[0]-1, from[0], from[0]+1].include?(to[0]) && to[1] == from[1]-1
          return true
        elsif from[1] == 7 && to[1] == 5 && from[0] == to[0]
          return true
        end
      end
    end
    return false
  end

  def isKnightMove?(from, to)
    if inTable?(from, to)
      adds = [[-2,1],[-2,-1],[2,1],[2,-1],[-1,2],[-1,-2],[1,2],[1,-2]]
      from_added = adds.each {|a| a[0] += from[0]; a[1] += from[1];}
      return true if from_added.include?(to)
    end
    return false
  end

  def isRockMove?(from, to)
    if inTable?(from, to)
      if from[0]==to[0] || from[1]==to[1] &&
        !(from[0]==to[0] && from[1]==to[1])
        return true
      end
    end
    return false
  end

  def isBishopMove?(from, to)
    if inTable?(from, to)
      return false if from[0]==to[0] || from[1]==to[1]
      return true if (from[0]-to[0]).modulo(from[1]-to[1]) == 0
    end
    return false
  end

  def isKingMove?(from, to)
    if inTable?(from, to)
      adds = [[0,1],[0,-1],[1,0],[-1,0],[1,1],[-1,1],[1,-1],[-1,-1]]
      from_added = adds.each {|a| a[0] += from[0]; a[1] += from[1];}
      return true if from_added.include?(to)
    end
    return false
  end

  def isQueenMove?(from, to)
    return true if isRockMove?(from, to) || isBishopMove?(from, to)
    return false
  end
end

game = Chess.new
game.createTable
game.addPieces
game.display
game.movePiece?([1,1],[1,3])
game.movePiece?([2,2],[2,4])
game.movePiece?([3,1],[1,3])
game.movePiece?([1,2],[1,4])
game.display
=begin
=end