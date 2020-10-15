require './lib/chess'

describe Chess do
  subject {Chess.new}

  describe '#createTable' do
    it "Creates an array with 64 members - representing table" do
      expect(subject.createTable).to eql(Array.new(64,''))
    end
  end

  # Table is only described by numbers from 1 to 8
  describe '#inTable?' do
    it "Simple check if any index is within the table or not" do
      expect(subject.inTable?([1,1],[3,3])).to eql(true)
      expect(subject.inTable?([0,1],[3,3])).to eql(false)
      expect(subject.inTable?([1,1],[9,3])).to eql(false)
    end
  end

  describe '#isPawnMove?' do
    it "Looks if given movement for PAWN is valid (empty table)" do
      expect(subject.isPawnMove?('white',[1,1],[1,2])).to eql(true)
      expect(subject.isPawnMove?('black',[1,1],[1,2])).to eql(false)
      expect(subject.isPawnMove?('white',[1,1],[1,3])).to eql(false)
      expect(subject.isPawnMove?('white',[1,1],[2,2])).to eql(true)
      expect(subject.isPawnMove?('white',[1,1],[10,2])).to eql(false)
      expect(subject.isPawnMove?('black',[2,2],[2,1])).to eql(true)
    end
  end

  describe '#isKnightMove?' do
    it "Looks if given movement for KNIGHT is valid (empty table)" do
      expect(subject.isKnightMove?([1,1],[2,3])).to eql(true)
      expect(subject.isKnightMove?([1,1],[1,4])).to eql(false)
      expect(subject.isKnightMove?([1,1],[3,0])).to eql(false)
    end
  end

  describe '#isRockMove?' do
    it "Looks if given movement for ROCK is valid (empty table)" do
      expect(subject.isRockMove?([1,1],[1,8])).to eql(true)
      expect(subject.isRockMove?([1,1],[8,1])).to eql(true)
      expect(subject.isRockMove?([1,1],[8,8])).to eql(false)
      expect(subject.isRockMove?([1,1],[0,0])).to eql(false)
    end
  end

  describe '#isBishopMove?' do
    it "Looks if given movement for BISHOP is valid (empty table)" do
      expect(subject.isBishopMove?([1,1],[1,8])).to eql(false)
      expect(subject.isBishopMove?([1,1],[8,1])).to eql(false)
      expect(subject.isBishopMove?([1,1],[8,8])).to eql(true)
    end
  end

  describe '#isKingMove?' do
    it "Looks if given movement for KING is valid (empty table)" do
      expect(subject.isKingMove?([1,1],[1,2])).to eql(true)
      expect(subject.isKingMove?([1,1],[2,2])).to eql(true)
      expect(subject.isKingMove?([1,1],[8,8])).to eql(false)
    end
  end

  describe '#isQueenMove?' do
    it "Looks if given movement for QUEEN is valid (empty table)" do
      expect(subject.isQueenMove?([1,1],[1,8])).to eql(true)
      expect(subject.isQueenMove?([1,1],[8,1])).to eql(true)
      expect(subject.isQueenMove?([1,1],[8,8])).to eql(true)
      expect(subject.isQueenMove?([1,1],[3,0])).to eql(false)
    end
  end

  describe '#arrayToTable' do
    it "Converts given array (2 element) to table location (single element)" do
      expect(subject.arrayToTable([1,1])).to eql(0)
      expect(subject.arrayToTable([4,4])).to eql(27)
      expect(subject.arrayToTable([8,8])).to eql(63)
    end
  end

  describe '#isChessman?' do
    it "Checks if there is a chessman at a given location" do
      subject.createTable
      subject.addPieces
      expect(subject.isChessman?([1,1])).to eql(true)
      expect(subject.isChessman?([1,3])).to eql(false)
      expect(subject.isChessman?([3,1])).to eql(true)
    end
  end

  describe '#getColor' do
    it "Gets the color of a piece at the table" do
      subject.createTable
      subject.addPieces
      expect(subject.getColor([1,1])).to eql('white')
      expect(subject.getColor([3,3])).to eql('none')
      expect(subject.getColor([8,8])).to eql('black')
    end
  end

  describe '#whichChessman' do
    it "Returns a string describing which chessman is on given area" do
      subject.createTable
      subject.addPieces
      expect(subject.whichChessman([1,1])).to eql('rock')
      expect(subject.whichChessman([4,1])).to eql('queen')
      expect(subject.whichChessman([7,1])).to eql('knight')
      expect(subject.whichChessman([1,7])).to eql('pawn')
      expect(subject.whichChessman([4,4])).to eql('none')
    end
  end

  describe '#movePiece?' do
    it "Moves a piece if possible (return true) otherwise returns false" do
      subject.createTable
      subject.addPieces
      expect(subject.movePiece?([1,1],[7,1])).to eql(false)
      expect(subject.movePiece?([1,2],[7,1])).to eql(false)
      expect(subject.movePiece?([1,2],[1,3])).to eql(true)
      expect(subject.movePiece?([2,1],[4,2])).to eql(false)
      expect(subject.movePiece?([2,1],[1,3])).to eql(false)
      expect(subject.movePiece?([7,1],[6,3])).to eql(true)
      subject.display
    end
  end
end