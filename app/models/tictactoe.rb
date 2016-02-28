class TicTacToe

  def self.play(submitted_raw_board)
    board = Board.new(submitted_raw_board)
    game = GamePlay.new(board)
    gameover = game.gameover?

    if gameover
      winning_player = game.symbol_of_winner
      {:board => submitted_raw_board,:gameover => gameover, :winner => winning_player}
    else
      game.computer_turn
      finished_raw_board = game.display_board
      status = game.gameover?
      winning_player = game.symbol_of_winner

      {:board => finished_raw_board,:gameover => status, :winner => winning_player }
    end
  end

end
