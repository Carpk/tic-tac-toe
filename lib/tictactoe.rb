module TicTacToe

  def self.play(board)
    board = Board.new_board unless BoardValidator.validates?(board)

    game = GamePlay.new(board)

    game.computer_turn unless game.gameover?

    {:board => game.display_board, :gameover => game.gameover?, :winner => game.symbol_of_winner}
  end
end
