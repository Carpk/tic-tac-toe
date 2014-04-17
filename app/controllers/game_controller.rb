class GameController < ApplicationController

  def create
    puts params
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    position = 3
    data = {:cell => position }
    render :json => data, :status => :ok
  end
end
