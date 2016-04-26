require 'rails_helper'

describe BoardValidator do

  let(:n) {Appdata::TOKENS[:blank]}  

  it "should validate appropriate board" do
    board = Board.new([n, n, n, n, n, n, n, n, n])
    expect(BoardValidator.validates?(board)).to eq(true)
  end

  it "should not validate board with boolean element" do
    board = Board.new([n, n, n, n, true, n, n, n, n])
    expect(BoardValidator.validates?(board)).to eq(false)
  end

  it "should not validate board with long string" do
    board = Board.new([n, n, n, n, "hi", n, n, n, n])
    expect(BoardValidator.validates?(board)).to eq(false)
  end

  it "should know board is valid" do
    board = Board.new(Array.new(9,n))
    expect(BoardValidator.new(board).valid?).to eq(true)
  end
end
