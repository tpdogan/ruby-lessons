require './lib/test'

describe Test do
  subject {Test.new}
  describe "#putter" do
    it 'qq' do
      expect do
        subject
      end.to output("aq\n").to_stdout
    end
    it 'qq' do
      expect do
        subject
      end.to output("aq\n").to_stdout
      expect do
        subject.putter
      end.to output("qq\n").to_stdout
    end
  end
  describe "#getter" do
    it 'cc' do
      expect do
        subject
      end.to output("aq\n").to_stdout
      expect(subject.getter("abe")).to eql("abe")
    end
  end
end