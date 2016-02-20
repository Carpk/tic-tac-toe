class ComputerAi

  def initialize(params)
    @game_piece = params[:symbol]
    @enemy_piece = params[:opponent]
    @efficent_value ||= -2520
  end

  def assert_values(board)
    position_values = {}
    board.indexes_of_available_spaces.each do |empty_position|
      puts "for position #{empty_position}"
      possible_board = TicTacToeBoard.new(board.grid.clone)
      possible_board.assign_token_to(@game_piece, empty_position)
      position_values[empty_position] = evaluate_board(possible_board, @enemy_piece, @game_piece)
    end
    puts "#{position_values}"
    select_random_index(position_values)
  end

  def inefficient_return_from(depth)
    @efficent_value >= (2520 / depth)
  end

  def assign_efficency_value(value)
    @efficent_value = value if value > @efficent_value
  end

  def evaluate_board(board, current_player, passing_player, depth=1)
    #puts "ev: #{@efficent_value}, cv: #{create_value(board)/depth}, dp: #{depth}, #{gameover?(board) || inefficient_return_from(depth)}"
    return create_value(board) / depth if gameover?(board) || inefficient_return_from(depth)

    board_values = []

    board.indexes_of_available_spaces.each do |empty_position|
      played_board = TicTacToeBoard.new(board.grid.clone)
      played_board.assign_token_to(current_player, empty_position)

      new_value = evaluate_board(played_board, passing_player, current_player, depth +1)

      assign_efficency_value(new_value)

      board_values << new_value
      puts "#{board_values}"
    end

    min_or_max(board_values, current_player)
  end

  def min_or_max(board_values, player)
    player == @game_piece ? board_values.reduce(:+) : board_values.compact.min
  end

  def select_random_index(position_values)
    max_value = position_values.each_value.max

    position_values.delete_if {|k,v| v < max_value }.keys.sample
  end

  def gameover?(board)
    GamePlay.new(board).gameover?
  end

  def create_value(board)
    winner = GamePlay.new(board).winner_of
    { @game_piece => 2520, @enemy_piece => -2520, nil => 0 }[winner]
     #@game_piece == GamePlay.new(board).winner_of ? 2520 : -2520
  end

end

