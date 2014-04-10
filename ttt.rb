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
  end

  def pc_turn
    pc = @pc.assess(@board)
    @board[pc[0]][pc[1]] = " X "
    @token = "hooman_turn"
    play
  end

  def hooman_turn
    hm = @view.prompt_player.to_i
    @board[hm - 1] = " O "
    @token = "pc_turn"
    play
  end

  def play
    @view.display_board(@board.flatten)
    self.send(@token)
  end

end

TicTacToe.new.play 