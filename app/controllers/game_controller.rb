class GameController < ApplicationController

  def new
    board = Array.new(9, " ")
    data = TicTacToe.play(board)
    # board[[0,2,6,8].sample] = "O"
    # data = {:board => board}
    render :json => data, :status => :ok
  end

  def create
    data = TicTacToe.play(params[:board])
    render :json => data, :status => :ok
  end
end
