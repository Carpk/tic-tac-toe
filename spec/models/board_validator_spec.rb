require 'rails_helper'

describe BoardValidator do

  let(:n) {Appdata::TOKENS[:blank]}  

  it "should validate appropriate board" do
    array = [n, n, n, n, n, n, n, n, n]
    expect(BoardValidator.validates?(array)).to eq(true)
  end

  it "should not validate board with boolean element" do
    array = [n, n, n, n, true, n, n, n, n]
    expect(BoardValidator.validates?(array)).to eq(false)
  end

  it "should not validate board with long string" do
    array = [n, n, n, n, "hi", n, n, n, n]
    expect(BoardValidator.validates?(array)).to eq(false)
  end

  it "should know board is valid" do
    array = Array.new(9,n)
    expect(BoardValidator.new(array).valid?).to eq(true)
  end
end
