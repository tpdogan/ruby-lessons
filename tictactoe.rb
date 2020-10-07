class Table
  @table
  def initialize
    @table = Array.new(9,'-')
  end

  def play(char, position)
    if @table[position] == '-' && (0..8).include?(position)
      @table[position] = char
      display
      return true
    else
      print "This position is invalid. Insert another: "
      return false
    end
  end

  def display
    puts @table[0..2].join(' ') + ' ' + (0..2).to_a.join(' ')
    puts @table[3..5].join(' ') + ' ' + (3..5).to_a.join(' ')
    puts @table[6..8].join(' ') + ' ' + (6..8).to_a.join(' ')
  end
end

class TicTacToe < Table
  @turn
  def initialize
    super
    puts "New board is created:"
    display
    game
  end

  def game
    turn = 'X'
    while !win? do
      played = false
      if turn == 'X'
        print "Player 1 plays (X): "
        while !played
          move = gets.chomp
          if (move.empty?); move = '-'; end
          move = move.ord - 48
          played = play("X", move)
        end
        turn = 'O'
        played = false
      else
        print "Player 2 plays (O): "
        while !played
          move = gets.chomp
          if (move.empty?); move = '-'; end
          move = move.ord - 48
          played = play("O", move)
        end
        turn = 'X'
        played = false
      end
    end
  end

  def win?
    if @table[0] == @table[1] && @table[1] == @table[2] && @table[2] != "-" ||
      @table[3] == @table[4] && @table[4] == @table[5] && @table[5] != "-"  ||
      @table[6] == @table[7] && @table[7] == @table[8] && @table[8] != "-"  ||
      @table[0] == @table[3] && @table[3] == @table[6] && @table[6] != "-"  ||
      @table[1] == @table[4] && @table[4] == @table[7] && @table[7] != "-"  ||
      @table[2] == @table[5] && @table[5] == @table[8] && @table[8] != "-"  ||
      @table[0] == @table[4] && @table[4] == @table[8] && @table[8] != "-"  ||
      @table[2] == @table[4] && @table[4] == @table[6] && @table[6] != "-" 
      puts "Game won by #{@turn=='X' ? 'O' : 'X'}."
      return true
    elsif @table.none?('-')
      puts "It is a draw."
      return true
    else
      return false
    end
  end
end

game = TicTacToe.new
=begin
game.display
game.play('X',2)
game.display
game.guide
game.play('X',1)
game.play('O',5)
game.play('X',0)
game.play('O',6)
game.play('X',2)
game.win?
=end