class GameController < ApplicationController

  def new
    board = Array.new(9, "")
    board[[0,2,6,8].sample] = "O"
    data = {:board => board}
    render :json => data, :status => :ok
  end

  def create
    # GamePlay.new(TicTacToeBoard.new(Array.new(9," ")))
    puts params[:positions].last.to_i
    position = ComputerAi.new.assess(session[:hu])
    status = session[:pc].win?
    data = {:position => position,:win => status }
    render :json => data, :status => :ok
  end
end
