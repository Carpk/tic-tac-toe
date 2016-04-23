module TicTacToe

  def self.play(submitted_board)
    board = Board.new(submitted_board)
    # board = Board.new_board unless board.valid?
    
    game = GamePlay.new(board)

    game.computer_turn unless game.gameover?

    {:board => game.display_board, :gameover => game.gameover?, :winner => game.symbol_of_winner}
  end

end
