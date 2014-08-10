require_relative '../models/computer_ai'
require_relative '../models/gameplay'
require_relative '../models/player'
require_relative '../models/tictactoeboard'

class Game

  def self.play(board)
    puts "PARAMS PASSED BOARD: #{board}"
    # binding.pry

    tttboard = TicTacToeBoard.new(board)
    game = GamePlay.new( tttboard )

    position = game.computer_turn

    # tttboard[position] = "O"

    # puts "WHAT DOES GAME#COMPUTER_TURN RETURN? #{game.computer_turn}"
    puts "LOOK FOR COUNTER MOVE!: #{game.display_board}"
    board = game.display_board

    status = game.gameover?

    {:board => board,:win => status }
  end
end