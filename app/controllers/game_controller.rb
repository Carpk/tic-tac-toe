class GameController < ApplicationController

  def create
    puts params
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    @value = [3]
    render :nothing => true
  end
end
