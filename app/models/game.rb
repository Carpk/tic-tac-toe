class Game

  def self.play(submitted_raw_board)

    board = TicTacToeBoard.new(submitted_raw_board)
    game = GamePlay.new(board)
    gameover = game.gameover?

    if gameover
      winning_player = game.winner_of
      puts "winner of game board is: #{winning_player}"
      {:board => submitted_raw_board,:gameover => gameover, :winner => winning_player}
    else
      game.computer_turn
      finished_raw_board = game.display_board
      status = game.gameover?
      winning_player = game.winner_of

      {:board => finished_raw_board,:gameover => status, :winner => winning_player }
    end
  end

end
