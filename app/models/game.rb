require_relative '../models/computer_ai'
require_relative '../models/gameplay'
require_relative '../models/player'
require_relative '../models/tictactoeboard'

class Game

  def self.play(old_board)

    tttboard = TicTacToeBoard.new(old_board)
    game = GamePlay.new(tttboard)
    gameover = game.gameover?

    if gameover
      {:board => old_board,:win => gameover }
    else
      game.computer_turn
      board = game.display_board
      status = game.gameover?

      {:board => board,:win => status }
    end
  end

end
