class ComputerAi
  attr_reader :game_piece, :enemy_piece, :value_matrix
  attr_accessor :efficient_value

  def initialize(params)
    @game_piece = params[:current_symbol]
    @enemy_piece = params[:opponent_symbol]
    @value_matrix = calculate_matrix_value(params[:board].size)
    @efficient_value = -value_matrix
  end

  def create_board(params)
    Board.new(params)
  end

  def create_game(params)
    GamePlay.new(params)
  end

  def calculate_matrix_value(board_size)
    (2..board_size).reduce(:*)
  end

  def next_position_for(board)
    position_values = {}
    board.indexes_of_available_spaces.each do |empty_position|
      possible_board = create_board(board.clone)
      possible_board.assign_token_to(game_piece, empty_position)
      position_values[empty_position] = position_value(possible_board, enemy_piece, game_piece)
    end
    select_random_index(position_values)
  end

  def inefficient_return_from?(depth)
    efficient_value >= (value_matrix / depth)
  end
  
  def check_efficiency_for(new_value)
    self.efficient_value= new_value if new_value > efficient_value 
  end

  def position_value(board, current_player, passing_player, depth=1)
    return value_of(board) / depth if gameover?(board) || inefficient_return_from?(depth)

    board_values = []

    board.indexes_of_available_spaces.each do |empty_position|
      played_board = create_board(board.clone)
      played_board.assign_token_to(current_player, empty_position)

      new_value = position_value(played_board, passing_player, current_player, depth +1)

      check_efficiency_for(new_value)

      board_values << new_value
    end

    min_or_max(board_values, current_player)
  end

  def min_or_max(board_values, player)
    player == game_piece ? board_values.compact.max : board_values.compact.min
  end

  def select_random_index(position_values)
    max_value = position_values.each_value.max

    position_values.delete_if {|k,v| v < max_value }.keys.sample
  end

  def gameover?(board)
    create_game(board).gameover?
  end

  def value_of(board)
    winning_token = create_game(board).symbol_of_winner
    { game_piece => value_matrix, enemy_piece => -value_matrix}[winning_token] || 0
  end
end

