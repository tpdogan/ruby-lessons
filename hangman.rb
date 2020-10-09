class Hangman
  attr_reader :result, :word
  @result = false
  def initialize(oldwords=[])
    @word = select_word(oldwords).downcase
    @wrong = 6
    @wrongGuess = []
    @answer = Array.new(@word.length,'_')
    game
  end

  def game
    while @wrong > 0 do
      puts `tput setaf 1;` + "You have #{@wrong} wrong guesses left!"
      
      if turn
        break true if win
      else
        @wrongGuess.push(@guess)
        @wrong -= 1
        lose
      end
    end
  end

  def turn
    puts `tput setaf 3;` + @answer.join(' ') +
      " (Wrong guesses: #{@wrongGuess.join(', ')})"
    @guess = ''
    while @guess.empty? || @wrongGuess.include?(@guess)
      print `tput setaf 2;` + 'Guess a letter: '
      @guess = gets.chomp
    end
    check
  end

  def check
    sample = @word.clone
    while sample.include? @guess do
      @answer[sample.index(@guess)] = @guess.downcase
      sample[sample.index(@guess)] = '_'
    end
    sample != @word ? true : false
  end

  def win
    if @answer.join == @word
      puts `tput setaf 2;` + "You have won!"
      puts `tput setaf 3;` + @answer.join(' ')
      @result = true
      return true
    end
  end

  def lose
    if @wrong == 0
      puts `tput setaf 1;` + "You have lost!"
      puts `tput bold;` + "The correct word was '#{@word}'" + `tput sgr0;`
    end
  end

  def select_word(oldwords)
    filename = 'hangman_words.txt'
    totalLines = `wc -l "#{filename}"`.strip.split(' ')[0].to_i
    
    word = ''
    while word == '' || oldwords.include?(word) do
      random = rand(totalLines)
      word = open(filename,'r').readlines[random]
      word = word[0..word.length-2]
      if word.length < 5 || word.length > 12
        word = ''
      else
        return word
      end
    end
  end
end

class Play_hangman
  def initialize
    @wins = 0
    @loses = 0
    @oldwords = []
    ans = 'y'
    play_saved?
    while ans.downcase.include? 'y' do
      playgame = Hangman.new(@oldwords)
      playgame.result ? @wins += 1 : @loses += 1
      @oldwords.push(playgame.word)
      puts `tput setaf 2;` + "Wins: #{@wins} " +`tput setaf 1;` + "Loses: #{@loses}"
      print `tput setaf 2;`+"Would you like to play another game or save? [y/n/s]"
      ans = gets.chomp
      
      if ans.downcase == 's'
        require 'json'
        ser = {}
        ser[:wins] = @wins
        ser[:loses] = @loses
        ser[:oldwords] = @oldwords
        open('hangman-save.txt','w').puts JSON.dump ser
        break
      end
    end
  end

  def play_saved?
    print "Would you like to continue saved game? [y/n] "
    ans = gets.chomp
    if ans.downcase.include? 'y'
      require 'json'
      string = open('hangman-save.txt','r').read
      ser = JSON.load string
      puts @wins = ser['wins'].to_i
      puts @loses = ser['loses'].to_i
      puts @oldwords = ser['oldwords']
    end
  end
end

Play_hangman.new