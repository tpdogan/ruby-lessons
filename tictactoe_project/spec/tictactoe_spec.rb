require './lib/tictactoe'

describe TicTacToe do
  subject {TicTacToe.new}
  describe "#win?" do
    it "Checks if the table has initially a winner" do
      expect(subject.win?).to eql(false)
    end
    it "Win when table has X X X in the first row" do
      subject.table = ['X', 'X', 'X', '-', '-', '-', '-', '-', '-']
      expect(subject.win?).to eql(true)
    end
    it "The table output is correct" do
      expect do
        subject
      end.to output("New board is created:\n- - - 0 1 2\n- - - 3 4 5\n- - - 6 7 8\n").to_stdout
    end
  end
end