class GameController < ApplicationController

  def new
    @pc = ComputerAi.new
    render :nothing => true
  end

  def create
    puts params

    position = 3
    data = {:position => position }
    render :json => data, :status => :ok
  end
end
