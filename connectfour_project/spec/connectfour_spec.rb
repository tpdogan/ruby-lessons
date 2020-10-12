require "./lib/connectfour"

describe ConnectFour do
  subject {ConnectFour.new}

  describe "#createTable" do
    it "Creates and returns array with 42 members" do
      expect(subject.createTable).to eql(Array.new(42,0))
    end
  end

  describe "#getMove" do
    it "Asks for a valid move" do
      expect(subject.getMove(1)).to eql("1")
    end

    it "Checks for an invalid move" do
      expect(subject.getMove("q")).to eql("Wrong move")
    end
  end

  describe "#fillPlace" do
    it "Fills the given location in table" do
      subject.createTable
      expect(subject.fillPlace("40",1)).to eql(Array.new(42,0)[40]=1)
    end
  end

  describe "#findPlace" do
    it "Finds the lowest empty place after filling" do
      subject.createTable
      expect(subject.findPlace("5")).to eql(40)
      subject.fillPlace("40",1)
      expect(subject.findPlace("5")).to eql(33)
    end
  end

  describe "#diagWin?" do
    it "Checks if four tiles are connected diagonally" do
      expect(subject.diagWin?([0,8,16,24])).to eql(true)
      expect(subject.diagWin?([0,7,16,24])).to eql(false)
      expect(subject.diagWin?([3,9,15,21])).to eql(true)
      expect(subject.diagWin?([4,9,15,21])).to eql(false)
      expect(subject.diagWin?([4,12,20,28])).to eql(false)
      expect(subject.diagWin?([17,25,33,41])).to eql(true)
      expect(subject.diagWin?([17,23,29,35])).to eql(true)
      expect(subject.diagWin?([16,22,28,34])).to eql(false)
    end
  end

  describe "rowWin?" do
    it "Checks if four tiles are connected in a row" do
      expect(subject.rowWin?([0,1,2,3])).to eql(true)
      expect(subject.rowWin?([24,25,26,27])).to eql(true)
      expect(subject.rowWin?([27,28,29,30])).to eql(false)
      expect(subject.rowWin?([11,12,13,14])).to eql(false)
    end
  end

  describe "colWin?" do
    it "Checks if four tiles are connected in a columnd" do
      expect(subject.colWin?([0,7,14,21])).to eql(true)
      expect(subject.colWin?([17,24,31,38])).to eql(true)
      expect(subject.colWin?([5,12,33,40])).to eql(false)
      expect(subject.colWin?([1,15,22,29])).to eql(false)
    end
  end

  describe "#gameOver?" do
    it "Checks if the game is over" do
      subject.createTable
      expect(subject.gameOver?).to eql(false)
      subject.fillPlace("40",1)
      subject.fillPlace("32",1)
      subject.fillPlace("24",1)
      subject.fillPlace("23",1)
      expect(subject.gameOver?).to eql(false)
      subject.fillPlace("16",1)
      expect(subject.gameOver?).to eql(true)
    end
  end
end

=begin
  "\u2699".encode("utf-8") +" " + "\u2638".encode("utf-8")
=end