class GameController < ApplicationController

  def new
    @pc = ComputerAi.new
    session[:pc] = [9]
    render :nothing => true
  end

  def create
    puts params[:positions].last

    position = 3
    data = {:position => position }
    render :json => data, :status => :ok
  end
end
