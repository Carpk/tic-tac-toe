module TicTacToe

  def self.play(submitted_board)
    board = Board.new(submitted_board)
    game = GamePlay.new(board)
    gameover = game.gameover?

    game.computer_turn unless gameover

    {:board => game.display_board, :gameover => game.gameover?, :winner => game.symbol_of_winner}
  end

end
