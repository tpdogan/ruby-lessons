class Board
  def initialize(cpu=false)
    @board = Array.new(48,0)
    @hints = Array.new(36,0)
    @cpu = cpu
  end

  private

  def play(a,b,c,d,index)
    @board[index*4..index*4+3] = [a,b,c,d]
    give_hints(a,b,c,d,index)
  end

  def give_hints(a,b,c,d,index)
    breaker = [a,b,c,d]
    @none = 4
    @color = 0
    @both = 0
    (0..3).each do |i|
      if @code.index(breaker[i]) == breaker.index(breaker[i])
        @both += 1
      elsif @code.include?(breaker[i])
        @color += 1
      end
    end
    @none = 4 -(@color + @both)
    @hints[index*3..index*3+2] = [@none, @color, @both]
    if @both == 4; @win = true; end
    display(index)
  end

  def display(index)
    for g in (0..index).reverse_each
      puts @board[g*4..g*4+3].join(' ') +
        '|' + "#{@hints[g*3]}: none, #{@hints[g*3+1]}: color, #{@hints[g*3+2]}: color and place"
    end
    puts '--------------------------------------------------------------'
  end

  def broken
    puts 'The code has been broken!'
  end
end

class Mastermind < Board
  def initialize(cpu=false)
    super
    if @cpu
      @code = Array.new
      while (!@code.all? || @code.length!=4) do
        r = rand(8) + 1
        if !@code.include?(r)
          @code.push(r)
        end
      end
    else
      print 'Enter your 4-digit code with spaces (ex: 1 2 3 4)(only 1 to 8): '
      entered = gets.chomp
      @code = entered.split(' ').map! {|ch| ch.to_i}
    end
    game
  end

  private
  
  def game
    if @cpu
      puts 'Try breaking the code. Good luck! Congratulations.'
      (0..11).each do |i|
        print 'Enter your guess with spaces: '
        entered = gets.chomp
        breaker = entered.split(' ').map! {|ch| ch.to_i}
        play(breaker[0],breaker[1],breaker[2],breaker[3],i)
        if @win; broken; break; end
      end
    else
      (0..11).each do |i|
        breaker = cpu_mind
        play(breaker[0],breaker[1],breaker[2],breaker[3],i)
        if @win; broken; break; end
      end
    end
  end

  def cpu_mind
    cpu_guess = Array.new
    while (!cpu_guess.all? || cpu_guess.length!=4) do
      r = rand(8) + 1
      if !cpu_guess.include?(r)
        cpu_guess.push(r)
      end
    end
    return cpu_guess
  end
end

newb = Mastermind.new(true)