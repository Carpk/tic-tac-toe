require 'rails_helper'

describe ComputerAi do

  let(:computer)  {ComputerAi.new({symbol: "x", opponent: "o"})}

  it "should take win instead of block" do
    grid = ["x", "x", " ",
            "o", " ", "o",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.assert_values(board)).to eq(2)
  end

  it "should take win instead of block as last move" do
    grid = ["x", "x", " ",
            "o", "o", "x",
            " ", "o", "o"]
    board = TicTacToeBoard.new(grid)
    expect(computer.assert_values(board)).to eq(2)
  end

  it "takes only spot on board" do
    grid = ["o", "x", "o",
            "x", " ", "x",
            "o", "o", "x"]
    board = TicTacToeBoard.new(grid)
    expect(computer.assert_values(board)).to eq(4)
  end

  it "should block player from win" do
    grid = ["o", "x", " ",
            "o", " ", "o",
            "x", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.assert_values(board)).to eq(4)
  end

  it "should take win when available" do
    grid = ["o", " ", "x",
            " ", " ", "o",
            "x", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.assert_values(board)).to eq(4)
  end

  xit "should take middle position to counter corner move" do
    grid = [" ", " ", "o",
            " ", " ", " ",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.assert_values(board)).to eq(4)
  end

  xit "should take mid position to counter middle perimeter move" do
    grid = [" ", " ", " ",
            " ", " ", "o",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect([2,3,4,8].include?(computer.assert_values(board))).to eq(true)
  end

  xit "should evaluate the board and return an integer" do
    grid = [" ", " ", " ",
            " ", " ", "o",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.evaluate_board(board, "x", "o")).to eq(0)
  end

  it "should evaluate the board and return an float" do
    grid = [" ", " ", " ",
            " ", "x", "o",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.evaluate_board(board, "x", "o")).to eq(0.16666666666666666)
  end

  it "should choose the hash with the highest value" do
    hash = { 3 => -0.3, 6 => 0.1, 7 => -0.3}
    expect(computer.select_random_index(hash)).to eq(6)
  end

  it "should choose the hash with the highest value" do
    hash = { 3 => -0.3, 6 => 0.1, 7 => -0.3, 8 => 1.0}
    expect(computer.select_random_index(hash)).to eq(8)
  end

  it "should choose the hash with the highest value" do
    hash = { 3 => -0.3, 4 => -0.1, 7 => -0.3}
    expect(computer.select_random_index(hash)).to eq(4)
  end

  it "should choose the hash with the highest value" do
    hash = { 3 => -0.3, 6 => 0.1, 7 => 0.1}
    expect([6,7].include?(computer.select_random_index(hash))).to eq(true)
  end

  it "should return true if game is over with full board" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    expect(computer.gameover?(board)).to eq(true)
  end

  it "should return true if game is over with diagonal win" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            " ", " ", "o"]
    board = TicTacToeBoard.new(grid)
    expect(computer.gameover?(board)).to eq(true)
  end

  it "should return false if game is not over" do
    grid = ["x", "x", "o",
            "x", "o", "x",
            " ", " ", "o"]
    board = TicTacToeBoard.new(grid)
    expect(computer.gameover?(board)).to eq(false)
  end

  it "should return a 0 value based on tie game" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    expect(computer.create_value(board)).to eq(0)
  end

  it "should create a negitve value based on board lose" do
    grid = ["o", "o", "o",
            "x", " ", "x",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.create_value(board)).to eq(-1)
  end

  it "should create a positive value based on incomplete board win" do
    grid = ["x", " ", " ",
            "o", "x", "o",
            " ", " ", "x"]
    board = TicTacToeBoard.new(grid)
    expect(computer.create_value(board)).to eq(1)
  end

  it "returns correct value of last position winning move" do
    grid = ["o", "x", "o",
            "x", "x", "x",
            "o", "o", "x"]
    board = TicTacToeBoard.new(grid)
    expect(computer.create_value(board)).to eq(1)
  end

  it "returns zero value when board is incomplete" do
    grid = ["o", "x", "o",
            " ", "x", "x",
            "o", "o", "x"]
    board = TicTacToeBoard.new(grid)
    expect(computer.create_value(board)).to eq(0)
  end
end
