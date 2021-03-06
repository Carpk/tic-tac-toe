require 'rails_helper'

describe GamePlay do

  let(:game)      {GamePlay.new(Board.new(Array.new(9,n)))}
  let(:o) {Appdata::TOKENS[:computer]}
  let(:x) {Appdata::TOKENS[:player]}
  let(:n) {Appdata::TOKENS[:blank]}

  it "should know that a game is over from a full board" do
    grid = [x, o, x,
            o, x, o,
            o, x, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.gameover?).to eq(true)
  end

  it "should know that a game is over from a winning board" do
    grid = [x, o, n,
            o, x, o,
            o, x, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.gameover?).to eq(true)
  end

  it "should know that a game is not over" do
    grid = [x, o, n,
            o, x, o,
            o, x, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.gameover?).to eq(false)
  end

  it "should know that a game is not over with empty board" do
    grid = [n, n, n,
            n, n, n,
            n, n, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.gameover?).to eq(false)
  end

  it "should return correct winner of board" do
    grid = [x, o, n,
            x, x, n,
            x, o, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(x)
  end

  it "should return correct winner of board" do
    grid = [x, o, n,
            o, o, n,
            x, o, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(o)
  end

  it "should return correct winner of board" do
    grid = [x, o, o,
            o, x, o,
            x, o, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(o)
  end

  it "should return winner of a winning board" do
    grid = [x, o, n,
            o, n, o,
            x, x, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(x)
  end

  it "should return winner of a winning board" do
    grid = [x, o, n,
            o, o, o,
            x, n, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(o)
  end

  it "should return true if there is a matching array" do
    grid = [o, o, o,
            o, x, o,
            x, o, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(o)
  end

    it "should return true if there is a matching array" do
    grid = [x, x, n,
            o, o, o,
            x, o, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(o)
  end

  it "should return true if there is a matching array" do
    grid = [x, o, n,
            o, x, o,
            x, x, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(x)
  end

  it "should return false if only matches are empty cells" do
    grid = [x, o, n,
            o, x, n,
            x, o, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(x)
  end

  it "should return false if only matches are empty cells" do
    grid = [o, o, x,
            o, x, n,
            x, x, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.symbol_of_winner).to eq(x)
  end

  it "should know game is not over at start of game" do
    expect(game.gameover?).to eq(false)
  end

  it "should know if game is over with player win" do
    board = [n, o, n,
             n, o, n,
             n, o, n]
    game = GamePlay.new(Board.new(board))
    expect(game.gameover?).to eq(true)
  end

  it "should know if game is over with a full board" do
    board = [x, o, x,
             o, x, o,
             o, x, o]
    game = GamePlay.new(Board.new(board))
    expect(game.gameover?).to eq(true)
  end

  it "should know if game is not over with 1 empty cell" do
    board = [n, o, x,
             o, x, o,
             o, x, o]
    game = GamePlay.new(Board.new(board))
    expect(game.gameover?).to eq(false)
  end

  it "should get a number response from the ai" do
    board = [x, n, x,
             n, o, n,
             n, n, o]
    game = GamePlay.new(Board.new(board))
    expect(game.computer_turn.class).to eq(String)
  end
end

