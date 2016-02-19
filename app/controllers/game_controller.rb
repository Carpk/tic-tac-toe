class GameController < ApplicationController

  def new
    data = TicTacToe.play(Array.new(9, " "))
    render :json => data, :status => :ok
  end

  def create
    data = TicTacToe.play(params[:board])
    render :json => data, :status => :ok
  end
end
