class ConnectFour
  attr_accessor :table, :player, :status
  def initialize
    createTable
    @player = 1
    while !gameOver? do
      displayTable
      print "Player #{@player} plays: "
      playHand
    end
    displayTable
    puts @status
  end

  def createTable
    @table = Array.new(42,0)
  end

  def displayTable
    puts [1,2,3,4,5,6,7].join(" ")
    @table.each_index do |i|
      print `tput setaf #{15};`
      print "o " if @table[i] == 0
      if @table[i] == 1
        print `tput setaf #{10};` + "\u2699 ".encode("utf-8")
      elsif @table[i] == 2
        print `tput setaf #{11};` + "\u2638 ".encode("utf-8")
      end
      puts "" if [6,13,20,27,34,41].include? i
    end
  end

  def playHand
    entry = false
    while !entry do
      entry = getMove

      if entry
        move = findPlace(entry.to_i-1)

        if move < 0
          entry = false
        else
          if @player == 1
            fillPlace(move,1)
            @player = 2
          else
            fillPlace(move,2)
            @player = 1
          end
        end
      end
    end
  end

  def getMove(move=gets.chomp)
    if (1..7).include? move.to_i
      "#{move}"
    else
      false
    end
  end

  def findPlace(column)
    location = column.to_i - 7
    6.times do
      location += 7
      if @table[location] != 0
        location -= 7
        break
      end
    end
    return location
  end

  def fillPlace(location, char)
    @table[location.to_i] = char
  end

  def gameOver?
    p1 = @table.each_index.select {|idx| @table[idx]==1}
    p2 = @table.each_index.select {|idx| @table[idx]==2}

    if diagWin?(p1) || rowWin?(p1) || colWin?(p1)
      @status = "Player 1 " + "\u2699 ".encode("utf-8") + " wins!"; return true
    elsif diagWin?(p2) || rowWin?(p2) || colWin?(p2)
      @status = "Player 2 " + "\u2638 ".encode("utf-8") + " wins!"; return true
    elsif !@table.include?(0)
      @status = "It is draw!"; return true;
    end
    return false
  end

  def diagWin?(ary)
    ary.each do |i|
      if i%7 < 4 && ary.include?(i+8) && ary.include?(i+16) &&
                    ary.include?(i+24)
        return true 
      elsif i%7 > 2 && ary.include?(i+6) && ary.include?(i+12) &&
                       ary.include?(i+18)
        return true
      end
    end
    return false
  end

  def rowWin?(ary)
    ary.each do |i|
      if i%7 < 4 && ary.include?(i+1) && ary.include?(i+2) &&
                    ary.include?(i+3)
        return true 
      elsif i%7 > 2 && ary.include?(i-1) && ary.include?(i-2) &&
                       ary.include?(i-3)
        return true
      end
    end
    return false
  end

  def colWin?(ary)
    ary.each do |i|
      if i < 21 && ary.include?(i+7) && ary.include?(i+14) &&
                    ary.include?(i+21)
        return true 
      end
    end
    return false
  end
end

game = ConnectFour.new