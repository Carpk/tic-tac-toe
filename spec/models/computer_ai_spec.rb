require 'rails_helper'

describe ComputerAi do

  let(:computer)  {ComputerAi.new({current_symbol: x, opponent_symbol: o, board: Array.new(9)})}
  let(:o) {Appdata::TOKENS[:computer]}
  let(:x) {Appdata::TOKENS[:player]}
  let(:b) {Appdata::TOKENS[:blank]}

  it "should take win instead of block" do
    grid = [x, x, b,
            o, b, o,
            b, b, b]
    board = Board.new(grid)
    expect(computer.next_position_for(board)).to eq(2)
  end

  it "should take win instead of block as last move" do
    grid = [x, x, b,
            o, o, x,
            b, o, o]
    board = Board.new(grid)
    expect(computer.next_position_for(board)).to eq(2)
  end

  it "takes only spot on board" do
    grid = [o, x, o,
            x, b, x,
            o, o, x]
    board = Board.new(grid)
    expect(computer.next_position_for(board)).to eq(4)
  end

  it "should block player from win" do
    grid = [o, x, b,
            o, b, o,
            x, b, b]
    board = Board.new(grid)
    expect(computer.next_position_for(board)).to eq(4)
  end

  it "should take win when available" do
    grid = [o, b, x,
            b, b, o,
            x, b, b]
    board = Board.new(grid)
    expect(computer.next_position_for(board)).to eq(4)
  end

  it "should evaluate the board and return an number" do
    grid = [b, b, b,
            b, x, o,
            b, b, b]
    board = Board.new(grid)
    expect(computer.send(:position_value, board, x, o)).to eq(0)
  end

  it "should choose the hash with the highest value" do
    hash = { 3 => -0.3, 6 => 0.3, 7 => 0.1}
    expect(computer.send(:select_random_index, hash)).to eq(6)
  end

  it "should create a negitve value based on board lose" do
    grid = [o, o, o,
            x, b, x,
            b, b, b]
    board = Board.new(grid)
    expect(computer.send(:value_of,board)).to be < 0
  end

  it "should create a positive value based on incomplete board win" do
    grid = [x, b, b,
            o, x, o,
            b, b, x]
    board = Board.new(grid)
    expect(computer.send(:value_of, board)).to be > 0
  end
end
