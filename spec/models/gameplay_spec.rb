require 'rails_helper'

describe GamePlay do

  let(:game)      {GamePlay.new(TicTacToeBoard.new(Array.new(9," ")))}

  it "should know that a game is over from a full board" do
    grid = ["x", "o", "x",
            "o", "x", "o",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.gameover?.should eq(true)
  end

  it "should know that a game is over from a winning board" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.gameover?.should eq(true)
  end

  it "should know that a game is not over" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.gameover?.should eq(false)
  end

  it "should know that a game is not over with empty board" do
    grid = [" ", " ", " ",
            " ", " ", " ",
            " ", " ", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.gameover?.should eq(false)
  end

  it "should return false if there is no winner" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "o", "x", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(false)
  end

  it "should return true if there is a matching array" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "x", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

  it "should return true if there is a matching array" do
    grid = ["o", "o", "o",
            "o", "x", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

    it "should return true if there is a matching array" do
    grid = ["x", "x", " ",
            "o", "o", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "x", " ",
            "x", "x", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(false)
  end

  it "should return false if only matches are empty cells" do
    grid = [" ", " ", " ",
            " ", " ", " ",
            " ", " ", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(false)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "x", "x", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "o", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", "o",
            "o", "x", "o",
            "x", "o", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "x", " ",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

  it "should return false if only matches are empty cells" do
    grid = ["o", "o", "x",
            "o", "x", " ",
            "x", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.board_has_winner?.should eq(true)
  end

  it "should return correct winner of board" do
    grid = ["x", "o", " ",
            "x", "x", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("x")
  end

  it "should return correct winner of board" do
    grid = ["x", "o", " ",
            "o", "o", " ",
            "x", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("o")
  end

  it "should return correct winner of board" do
    grid = ["x", "o", "o",
            "o", "x", "o",
            "x", "o", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("o")
  end

  it "should return winner of a winning board" do
    grid = ["x", "o", " ",
            "o", " ", "o",
            "x", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("x")
  end

  it "should return winner of a winning board" do
    grid = ["x", "o", " ",
            "o", "o", "o",
            "x", " ", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("o")
  end

  it "should return true if there is a matching array" do
    grid = ["o", "o", "o",
            "o", "x", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("o")
  end

    it "should return true if there is a matching array" do
    grid = ["x", "x", " ",
            "o", "o", "o",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("o")
  end

  it "should return true if there is a matching array" do
    grid = ["x", "o", " ",
            "o", "x", "o",
            "x", "x", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("x")
  end

  it "should return false if only matches are empty cells" do
    grid = ["x", "o", " ",
            "o", "x", " ",
            "x", "o", "x"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("x")
  end

  it "should return false if only matches are empty cells" do
    grid = ["o", "o", "x",
            "o", "x", " ",
            "x", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.winner_of.should eq("x")
  end

  it "should return true if board is tied" do
    grid = ["x", "o", "x",
            "x", "o", "x",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.tie_game?.should eq(true)
  end

  it "should return false if board is not full" do
    grid = ["x", "o", " ",
            "x", "o", "x",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.tie_game?.should eq(false)
  end

  it "should return false if board has a winner" do
    grid = ["o", "o", " ",
            "x", "o", "x",
            "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(grid))
    game.tie_game?.should eq(false)
  end

  it "should be false if first cell is empty" do
    section = [" ", "g", "g"]
    game.group_match?(section).should eq(false)
  end

  it "should be false if second cell is empty" do
    section = ["g", " ", "g"]
    game.group_match?(section).should eq(false)
  end

  it "should be false if last cell is empty" do
    section = ["g", "g", " "]
    game.group_match?(section).should eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = ["g", "x", "g"]
    game.group_match?(section).should eq(false)
  end

  it "should be false if argument contains only 2 the same character" do
    section = ["g", "g", "x"]
    game.group_match?(section).should eq(false)
  end

  it "should be false if section is completely empty" do
    section = [" ", " ", " "]
    game.group_match?(section).should eq(false)
  end

  it "should be true if argument contains the same character" do
    section = ["g", "g", "g"]
    game.group_match?(section).should eq(true)
  end

  it "should create new players from hash" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash).class.should eq(Hash)
  end

  it "should know game is not over at start of game" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.gameover?.should eq(false)
  end

  it "should know if game is over with player win" do
    board = [" ", "o", " ",
             " ", "o", " ",
             " ", "o", " "]
    game = GamePlay.new(TicTacToeBoard.new(board))
    game.gameover?.should eq(true)
  end

  it "should know if game is over with a full board" do
    board = ["x", "o", "x",
             "o", "x", "o",
             "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(board))
    game.gameover?.should eq(true)
  end

  it "should know if game is not over with 1 empty cell" do
    board = [" ", "o", "x",
             "o", "x", "o",
             "o", "x", "o"]
    game = GamePlay.new(TicTacToeBoard.new(board))
    game.gameover?.should eq(false)
  end

  it "display board should be of the correct length" do
    game.display_board.length.should eq(9)
  end

  it "game token should occupy position" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.player_move_to(3)
    game.display_board[3].should eq("x")
  end

  it "should create a players hash" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash).class.should eq(Hash)
  end

  it "should correctly set player position" do
    board = [" ", " ", " ",
             " ", "o", " ",
             " ", " ", " "]
    game = GamePlay.new(TicTacToeBoard.new(board))
    game.display_board[4].should eq("o")
  end

  it "should move player to correct position" do
    hash = {player1: {symbol: "x", ai: "n"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.player_move_to(5)
    game.display_board[5].should eq("x")
  end

  it "should get a response from the ai" do
    board = ["o", " ", "x",
             " ", "o", " ",
             " ", " ", "o"]
    game = GamePlay.new(TicTacToeBoard.new(board))
    hash = {player1: {symbol: "x", ai: "y"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.current_player[:player].class.should eq(Player)
  end

  it "should get a number response from the ai" do
    board = ["x", " ", "x",
             " ", "o", " ",
             " ", " ", "o"]
    game = GamePlay.new(TicTacToeBoard.new(board))
    hash = {player1: {symbol: "x", ai: "y"}, player2: {symbol: "o", ai: "n"}}
    game.create_players(hash)
    game.computer_turn.class.should eq(Fixnum)
  end
end
