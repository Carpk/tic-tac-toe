require 'rails_helper'

describe GameController do

  let(:computer)  {ComputerAi.new({symbol: "x", opponent: "o"})}

  it "should take win instead of block" do
    grid = ["x", "x", " ",
            "o", " ", "o",
            " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    expect(computer.assert_values(board)).to eq(2)
  end
end