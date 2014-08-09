require_relative "../lib/console"

require 'rspec'

describe InputValidator do

  let(:validate)  {InputValidator.new}
  let(:board)     {TicTacToeBoard.new([" ", "x", " ",
                    " ", "o", " ",
                    " ", " ", " "])}

  it "should validate if hash is acceptable" do
    hash = {player1: {symbol: "1", ai: "n"}, player2: {symbol: "2", ai: "n"}}
    InputValidator.valid_hash?(hash).should eq(true)
  end

  it "should not validate if token is less than 1 character" do
    hash = {player1: {symbol: "", ai: "n"}, player2: {symbol: "2", ai: "n"}}
    InputValidator.valid_hash?(hash).should eq(false)
  end

  it "should not validate if token is greater than 1 character" do
    hash = {player1: {symbol: "1", ai: "n"}, player2: {symbol: "tree", ai: "n"}}
    InputValidator.valid_hash?(hash).should eq(false)
  end

  it "should not validate if both tokens are the same" do
    hash = {player1: {symbol: "g", ai: "n"}, player2: {symbol: "g", ai: "n"}}
    InputValidator.valid_hash?(hash).should eq(false)
  end

  it "should validate if move is acceptable" do
    move = 3
    InputValidator.valid_move?(board.indexes_of_available_spaces, move).should eq(true)
  end

  it "should not validate if player is already positioned" do
    move = 2
    InputValidator.valid_move?(board.indexes_of_available_spaces, move).should eq(false)
  end

  it "should not validate if move too great of a number" do
    move = 12
    InputValidator.valid_move?(board.indexes_of_available_spaces, move).should eq(false)
  end

  it "should not validate if move is empty" do
    move = ""
    InputValidator.valid_move?(board.indexes_of_available_spaces, move).should eq(false)
  end

  it "should not validate if move is a string" do
    move = "tree"
    InputValidator.valid_move?(board.indexes_of_available_spaces, move).should eq(false)
  end
end
