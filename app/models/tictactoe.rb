module TicTacToe

  def self.play(raw_board)
    board = BoardValidator.validates?(raw_board) ? Board.new(raw_board) : Board.new(Board.new_board)

    game = GamePlay.new(board)

    game.computer_turn unless game.gameover?

    {:board => game.display_board, :gameover => game.gameover?, :winner => game.symbol_of_winner}
  end
end
