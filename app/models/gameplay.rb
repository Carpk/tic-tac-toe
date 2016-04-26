class GamePlay
  
  def initialize(board)
    @board = board
    @ai = ComputerAi.new({current_symbol: Appdata::TOKENS[:computer], 
                          opponent_symbol: Appdata::TOKENS[:player], 
                          board: board})
  end

  def gameover?
    board.board_full? || board_has_winner?
  end

  def symbol_of_winner
    matches = list_of_matches

    board.possible_wins[matches.index(true)].sample if matches.include?(true)
  end

  def computer_turn
    position = ai.next_position_for(board)
    board.assign_token_to(Appdata::TOKENS[:computer], position)
  end

  def display_board
    board.grid
  end

  private
  attr_reader :board, :ai

  def group_match?(section)
    section.rotate == section.delete_if {|e| e.strip.empty?}
  end

  def list_of_matches
    board.possible_wins.map {|section| group_match?(section)}
  end

  def board_has_winner?
    list_of_matches.include?(true)
  end

  def board_has_no_winner?
    !board_has_winner?
  end
end
