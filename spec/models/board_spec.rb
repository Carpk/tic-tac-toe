require 'rails_helper'

describe Board do

  let(:board)  {Board.new(Array.new(9," "))}

  it "should return the correct length of board" do
    expect(board.grid.length).to eq(9)
  end

  it "should return the correct length when initialized with large board" do
    board = Board.new(Array.new(20))
    expect(board.grid.length).to eq(20)
  end

  it "should return the correct length when initialized with small board" do
    board = Board.new(Array.new(4))
    expect(board.grid.length).to eq(4)
  end

  it "should return true for having multiple unassigned positions on board" do
    expect(board.unassigned_positions?).to eq(true)
  end

  it "should return false for not having unassigned positions on board" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = Board.new(grid)
    expect(board.unassigned_positions?).to eq(false)
  end

  it "should return true for having a unassigned position on board" do
    grid = ["o", "x", "o",
            "x", " ", "x",
            "x", "o", "x"]
    board = Board.new(grid)
    expect(board.unassigned_positions?).to eq(true)
  end

  it "should return false for empty board" do
    expect(board.board_full?).to eq(false)
  end

  it "should return false for empty position on board" do
    grid = ["o", "x", "o",
            "x", " ", "x",
            "x", "o", "x"]
    board = Board.new(grid)
    expect(board.board_full?).to eq(false)
  end

  it "should return false for empty board" do
    grid = ["o", "x", "o",
            "x", "o", "x",
            "x", "o", "x"]
    board = Board.new(grid)
    expect(board.board_full?).to eq(true)
  end

  it "should assign player to board position" do
    token, position = "r", 7
    board.assign_token_to(token, position)
    expect(board.grid[7]).to eq("r")
  end

  it "should assign player to board position" do
    token, position = "x", 3
    board.assign_token_to(token, position)
    expect(board.grid[3]).to eq("x")
  end

  it "should return the square root for board of 9" do

    expect(board.board_side_length).to eq(3)
  end

  it "should return the square root for board of 12" do
    grid = ["o", "x", "o", " ",
            "x", "o", "x", " ",
            "x", "o", "x", " ",
            " ", " ", " ", " "]
    board = Board.new(grid)
    expect(board.board_side_length).to eq(4)
  end

  it "should return the index positions of availible board positions" do
    grid = ['f','f','f',
            "g"," "," ",
            " ","g"," "]
    board = Board.new(grid)
    expect(board.indexes_of_available_spaces).to eq([4,5,6,8])
  end

  it "should return index positions of availible board positions" do
    grid = ["f"," ","f",
            "g"," ","f",
            " ","g","f"]
    board = Board.new(grid)
    expect(board.indexes_of_available_spaces).to eq([1,4,6])
  end

  it "should return empty array with full board" do
    grid = ["f","g","f",
            "g","g","f",
            "f","g","f"]
    board = Board.new(grid)
    expect(board.indexes_of_available_spaces).to eq([])
  end

  it "should return all positions with empty board" do
    grid = [" "," "," ",
            " "," "," ",
            " "," "," "]
    board = Board.new(grid)
    expect(board.indexes_of_available_spaces).to eq([0,1,2,3,4,5,6,7,8])
  end

  it "should return nested arry of all possible wins" do
    expect(board.possible_wins.length).to eq(8)
  end

  it "should return nested array for rows" do
    expect(board.row_sections[2].class).to eq(Array)
  end

  it "should return nested array for columns" do
    expect(board.column_sections[2].class).to eq(Array)
  end

  it "should return nested array for forwardslash " do
    expect(board.forwardslash_section.class).to eq(Array)
  end

  it "should return nested array for backslash " do
    expect(board.backslash_section.class).to eq(Array)
  end
end
