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
    @CONVERT =  [ "00", "01", "02", "10", "11", "12", "20", "21", "22"]
  end

  def pc_turn
    pc = @pc.assess(@board)
    @board[pc[0]][pc[1]] = " X "
    @token = "hooman_turn"
    play
  end

  def hooman_turn
    indices = @CONVERT[@view.prompt_player.to_i - 1]
    @board[indices[0].to_i][indices[1].to_i] = " O "
    @token = "pc_turn"
    play
  end

  def play
    @view.display_board(@board.flatten)
    self.send(@token)
  end

end

TicTacToe.new.play 