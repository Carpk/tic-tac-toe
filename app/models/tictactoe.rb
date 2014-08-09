class TicTacToe

  def initialize
    @view = DisplayUtility.new
    @game = GamePlay.new(TicTacToeBoard.new(Array.new(9," ")))
  end

  def start
    @view.welcome
    new_players = valid_players_hash
    @game.create_players(new_players)
    play
  end

  def valid_players_hash
    players_hash = create_players_hash
    until InputValidator.valid_hash?(players_hash)
      @view.invalid_input_error
      players_hash = create_players_hash
    end
    players_hash
  end

  def create_players_hash
    p1_symbol = @view.create_player_prompt("player1")
    p1_ai = @view.create_ai_request(p1_symbol)
    p2_symbol = @view.create_player_prompt("player2")
    p2_ai = @view.create_ai_request(p2_symbol)
    {player1: {symbol: p1_symbol, opponent: p2_symbol, ai: p1_ai},
     player2: {symbol: p2_symbol, opponent: p1_symbol, ai: p2_ai}}
  end

  def play
    until @game.gameover?
      board = @game.display_board
      @view.display_board(board)
      position = player_option
      @game.player_move_to(position)
    end
    @view.display_board(@game.display_board)
    @view.gameover_notice
  end

  def player_option
    if @game.current_player[:player].computer_active
      sleep(2)                            # REMOVE SLEEP AFTER TESTING
      @game.computer_turn
    else
      valid_player_move
    end
  end

  def valid_player_move
    player = @game.current_player[:player].game_piece
    new_position = @view.prompt_player_move(player).to_i
    until InputValidator.valid_move?( @game.available_spaces, new_position)
      @view.invalid_input_error
      new_position = @view.prompt_player_move(player).to_i
    end
    new_position - 1
  end

end
