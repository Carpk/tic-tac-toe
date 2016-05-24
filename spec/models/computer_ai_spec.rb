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
end

