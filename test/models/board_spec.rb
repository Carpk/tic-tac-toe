require_relative "../lib/console"

require 'rspec'

describe TicTacToeBoard do

  let(:board)  {TicTacToeBoard.new(Array.new(9," "))}

  it "should return the correct length of board" do
    board.grid.length.should eq(9)
  end

  it "should return the correct length when initialized with large board" do
    board = TicTacToeBoard.new(Array.new(20))
    board.grid.length.should eq(20)
  end

  it "should return the correct length when initialized with small board" do
    board = TicTacToeBoard.new(Array.new(4))
    board.grid.length.should eq(4)
  end

  it "should return true for having multiple unassigned positions on board" do
    board.unassigned_positions?.should eq(true)
  end

  it "should return false for not having unassigned positions on board" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    board.unassigned_positions?.should eq(false)
  end

  it "should return true for having a unassigned position on board" do
    grid = ["o", "x", "o",
            "x", " ", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    board.unassigned_positions?.should eq(true)
  end

  it "should return false for empty board" do
    board.board_full?.should eq(false)
  end

  it "should return false for empty position on board" do
    grid = ["o", "x", "o",
            "x", " ", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    board.board_full?.should eq(false)
  end

  it "should return false for empty board" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = TicTacToeBoard.new(grid)
    board.board_full?.should eq(true)
  end

  it "should assign player to board position" do
    token, position = "r", 7
    board.assign_token_to(token, position)
    board.grid[7].should eq("r")
  end

  it "should assign player to board position" do
    token, position = "x", 3
    board.assign_token_to(token, position)
    board.grid[3].should eq("x")
  end

  it "should return the square root for board of 9" do

    board.board_side_length.should eq(3)
  end

  it "should return the square root for board of 12" do
    grid = ["o", "x", "o", " ",
            "x", "o", "x", " ",
            "x", "o", "x", " ",
            " ", " ", " ", " "]
    board = TicTacToeBoard.new(grid)
    board.board_side_length.should eq(4)
  end

  it "should return the index positions of availible board positions" do
    grid = ['f','f','f',
            "g"," "," ",
            " ","g"," "]
    board = TicTacToeBoard.new(grid)
    board.indexes_of_available_spaces.should eq([4,5,6,8])
  end

  it "should return index positions of availible board positions" do
    grid = ["f"," ","f",
            "g"," ","f",
            " ","g","f"]
    board = TicTacToeBoard.new(grid)
    board.indexes_of_available_spaces.should eq([1,4,6])
  end

  it "should return empty array with full board" do
    grid = ["f","g","f",
            "g","g","f",
            "f","g","f"]
    board = TicTacToeBoard.new(grid)
    board.indexes_of_available_spaces.should eq([])
  end

  it "should return all positions with empty board" do
    grid = [" "," "," ",
            " "," "," ",
            " "," "," "]
    board = TicTacToeBoard.new(grid)
    board.indexes_of_available_spaces.should eq([0,1,2,3,4,5,6,7,8])
  end

  it "should return nested arry of all possible wins" do
    board.possible_wins.length.should eq(8)
  end

  it "should return nested array for rows" do
    board.row_sections[2].class.should eq(Array)
  end

  it "should return nested array for columns" do
    board.column_sections[2].class.should eq(Array)
  end

  it "should return nested array for forwardslash " do
    board.forwardslash_section[0].class.should eq(Array)
  end

  it "should return nested array for backslash " do
    board.backslash_section[0].class.should eq(Array)
  end
end
