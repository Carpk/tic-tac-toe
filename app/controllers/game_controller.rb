class GameController < ApplicationController

  def new
    board = Array.new(9, " ")
    board[[0,2,6,8].sample] = "O"
    data = {:board => board}
    render :json => data, :status => :ok
  end

  def create
    data = Game.play(params[:board])
    render :json => data, :status => :ok
  end
end
