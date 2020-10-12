require './lib/caesar_cipher'

describe '#caesar_cipher' do
  it "returns Bmfy f xywnsl!" do
    expect(caesar_cipher('What a string!')).to eql('Bmfy f xywnsl!')
  end
  it "returns Abcde?" do
    expect(caesar_cipher('uVwxyz?')).to eql('zAbcde?')
  end
  it "returns 1234" do
    expect(caesar_cipher('1234')).to eql('1234')
  end
end