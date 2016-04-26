require 'rails_helper'

describe TicTacToe do

  let(:x) {Appdata::TOKENS[:player]}

  it "should start a game" do
    board = Board.new(Array.new(9, x))

    expect(TicTacToe.play(board)).to have_key(:board)  
    expect(TicTacToe.play(board)).to have_key(:gameover)
    expect(TicTacToe.play(board)).to have_key(:winner)
  end
end
