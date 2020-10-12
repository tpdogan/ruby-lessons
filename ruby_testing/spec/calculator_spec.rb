#spec/calculator_spec.rb
require './lib/calculator'  #=> add this

describe Calculator do
  calculator = Calculator.new
  describe "#add" do
    it "returns the sum of two numbers" do
      # removed for brevity
    end

    # add this
    it "returns the sum of more than two numbers" do
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#multiply" do
    it "returns the multiplication of two numbers" do
      expect(calculator.multiply(4,5)).to eql(20)
    end
  end

  describe "#subtract" do
    it "returns the subtraction of two numbers" do
      expect(calculator.subtract(10,5)).to eql(5)
    end
  end

  describe "#divide" do
    it "returns the division of two numbers" do
      expect(calculator.divide(10,5)).to eql(2)
    end
  end
end
