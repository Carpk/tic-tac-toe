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

  it "should return false if there is no winner" do
    grid = [x, o, n,
            o, x, o,
            o, x, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(false)
  end

  it "should return true if there is a matching array" do
    grid = [x, o, n,
            o, x, o,
            x, x, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return true if there is a matching array" do
    grid = [o, o, o,
            o, x, o,
            x, o, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

    it "should return true if there is a matching array" do
    grid = [x, x, n,
            o, o, o,
            x, o, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = [x, o, n,
            o, x, n,
            x, x, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(false)
  end

  it "should return false if only matches are empty cells" do
    grid = [n, n, n,
            n, n, n,
            n, n, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(false)
  end

  it "should return false if only matches are empty cells" do
    grid = [x, o, n,
            x, x, n,
            x, o, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = [x, o, n,
            o, o, n,
            x, o, n]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = [x, o, o,
            o, x, o,
            x, o, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = [x, o, n,
            o, x, n,
            x, o, x]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = [o, o, x,
            o, x, n,
            x, x, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.board_has_winner?).to eq(true)
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

  it "should return true if board is tied" do
    grid = [x, o, x,
            x, o, x,
            o, x, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.tie_game?).to eq(true)
  end

  it "should return false if board is not full" do
    grid = [x, o, n,
            x, o, x,
            o, x, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.tie_game?).to eq(false)
  end

  it "should return false if board has a winner" do
    grid = [o, o, n,
            x, o, x,
            o, x, o]
    game = GamePlay.new(Board.new(grid))
    expect(game.tie_game?).to eq(false)
  end

  it "should be false if first cell is empty" do
    section = [n, o, o]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if second cell is empty" do
    section = [o, n, o]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if last cell is empty" do
    section = [o, o, n]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = [o, x, o]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = [o, o, x]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if section is completely empty" do
    section = [n, n, n]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be true if argument contains the same character" do
    section = [o, o, o]
    expect(game.group_match?(section)).to eq(true)
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

  it "display board should be of the correct length" do
    expect(game.display_board.length).to eq(9)
  end

  it "should correctly set player position" do
    board = [n, n, n,
             n, o, n,
             n, n, n]
    game = GamePlay.new(Board.new(board))
    expect(game.display_board[4]).to eq(o)
  end

  it "should get a number response from the ai" do
    board = [x, n, x,
             n, o, n,
             n, n, o]
    game = GamePlay.new(Board.new(board))
    expect(game.computer_turn.class).to eq(String)
  end
end
