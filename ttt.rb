require_relative 'ComputerAI'
require_relative 'tttview'

class TicTacToe

  def initialize
    @board = [["   ","   ","   "],
              ["   ","   ","   "],
              ["   ","   ","   "]]
    @token = "pc_turn"
    @pc = ComputerAI.new
    @view = TicTacToeView.new
    @CONVERT =  [ [0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
  end

  def pc_turn
    pc = @pc.assess(@board)
    @board[pc[0]][pc[1]] = " X "
    @token = "player_turn"
    play
  end

  def player_turn
    indices = @CONVERT[@view.prompt_player.to_i - 1]
    @board[indices[0]][indices[1]] = " O "
    @token = "pc_turn"
    play
  end

  def play
    @view.display_board(@board.flatten)
    self.send(@token)
  end

end

TicTacToe.new.play 