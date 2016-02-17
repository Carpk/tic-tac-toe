class TicTacToeBoard
  attr_reader :grid

  def initialize(board)
    @grid = board
  end

  def unassigned_positions?
    @grid.map {|e| e.strip.empty? }.include?(true)
  end

  def board_full?
    !unassigned_positions?
  end

  def assign_token_to(token, position)
    @grid[position] = token
  end

  def board_side_length
    Math.sqrt(@grid.length).to_i
  end

  def indexes_of_available_spaces
    @grid.each_index.select {|e| @grid[e].strip.empty? }
  end

  def possible_wins
    row_sections + column_sections << forwardslash_section << backslash_section
  end

  def row_sections
    @grid.each_slice(board_side_length).map {|slice| slice}
  end

  def column_sections
    @grid.each_slice(board_side_length).map {|slice| slice}.transpose
  end

  def forwardslash_section
    @grid.each_slice(board_side_length).map.with_index {|slice, i| slice[-1-i]}
  end

  def backslash_section
    @grid.each_slice(board_side_length).map.with_index {|slice, i| slice[i]}
  end
end
