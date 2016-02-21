require 'rails_helper'

describe GamePlay do

  let(:game)      {GamePlay.new(TicTacToeBoard.new(Array.new(9," ")))}

  it "should know that a game is over from a full board" do
    grid = ["x", "o", "x",
            "o", "x", "o",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.gameover?).to eq(true)
  end

  it "should know that a game is over from a winning board" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.gameover?).to eq(true)
  end

  it "should know that a game is not over" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.gameover?).to eq(false)
  end

  it "should know that a game is not over with empty board" do
    grid = [" ", " ", " ",
            " ", " ", " ",
            " ", " ", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.gameover?).to eq(false)
  end

  it "should return false if there is no winner" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(false)
  end

  it "should return true if there is a matching array" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "x", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return true if there is a matching array" do
    grid = ["o", "o", "o",
            "o", "x", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

    it "should return true if there is a matching array" do
    grid = ["x", "x", " ",
            "o", "o", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "x", " ",
            "x", "x", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(false)
  end

  it "should return false if only matches are empty cells" do
    grid = [" ", " ", " ",
            " ", " ", " ",
            " ", " ", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(false)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "x", "x", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "o", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", "o",
            "o", "x", "o",
            "x", "o", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "x", " ",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["o", "o", "x",
            "o", "x", " ",
            "x", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.board_has_winner?).to eq(true)
  end

  it "should return correct winner of board" do
    grid = ["x", "o", " ",
            "x", "x", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("x")
  end

  it "should return correct winner of board" do
    grid = ["x", "o", " ",
            "o", "o", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("o")
  end

  it "should return correct winner of board" do
    grid = ["x", "o", "o",
            "o", "x", "o",
            "x", "o", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("o")
  end

  it "should return winner of a winning board" do
    grid = ["x", "o", " ",
            "o", " ", "o",
            "x", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("x")
  end

  it "should return winner of a winning board" do
    grid = ["x", "o", " ",
            "o", "o", "o",
            "x", " ", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("o")
  end

  it "should return true if there is a matching array" do
    grid = ["o", "o", "o",
            "o", "x", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("o")
  end

    it "should return true if there is a matching array" do
    grid = ["x", "x", " ",
            "o", "o", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("o")
  end

  it "should return true if there is a matching array" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "x", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("x")
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "x", " ",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("x")
  end

  it "should return false if only matches are empty cells" do
    grid = ["o", "o", "x",
            "o", "x", " ",
            "x", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.symbol_of_winner).to eq("x")
  end

  it "should return true if board is tied" do
    grid = ["x", "o", "x",
            "x", "o", "x",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.tie_game?).to eq(true)
  end

  it "should return false if board is not full" do
    grid = ["x", "o", " ",
            "x", "o", "x",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.tie_game?).to eq(false)
  end

  it "should return false if board has a winner" do
    grid = ["o", "o", " ",
            "x", "o", "x",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    expect(game.tie_game?).to eq(false)
  end

  it "should be false if first cell is empty" do
    section = [" ", "g", "g"]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if second cell is empty" do
    section = ["g", " ", "g"]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if last cell is empty" do
    section = ["g", "g", " "]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = ["g", "x", "g"]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = ["g", "g", "x"]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be false if section is completely empty" do
    section = [" ", " ", " "]
    expect(game.group_match?(section)).to eq(false)
  end

  it "should be true if argument contains the same character" do
    section = ["g", "g", "g"]
    expect(game.group_match?(section)).to eq(true)
  end

  it "should know game is not over at start of game" do
    expect(game.gameover?).to eq(false)
  end

  it "should know if game is over with player win" do
    board = [" ", "o", " ",
             " ", "o", " ",
             " ", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(board))
    expect(game.gameover?).to eq(true)
  end

  it "should know if game is over with a full board" do
    board = ["x", "o", "x",
             "o", "x", "o",
             "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(board))
    expect(game.gameover?).to eq(true)
  end

  it "should know if game is not over with 1 empty cell" do
    board = [" ", "o", "x",
             "o", "x", "o",
             "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(board))
    expect(game.gameover?).to eq(false)
  end

  it "display board should be of the correct length" do
    expect(game.display_board.length).to eq(9)
  end

  it "should correctly set player position" do
    board = [" ", " ", " ",
             " ", "o", " ",
             " ", " ", " "]
    game = GamePlay.new(TicTacToeBoard.new(board))
    expect(game.display_board[4]).to eq("o")
  end

  it "should get a number response from the ai" do
    board = ["x", " ", "x",
             " ", "o", " ",
             " ", " ", "o"]
    game = GamePlay.new(TicTacToeBoard.new(board))
    expect(game.computer_turn.class).to eq(String)
  end
end
