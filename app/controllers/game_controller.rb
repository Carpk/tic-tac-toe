class GameController < ApplicationController

  def new
    session[:pc] = ComputerAi.new
    position = 9
    data = {:position => position }
    render :json => data, :status => :ok
  end

  def create
    position = session[:pc].assess(params[:positions].last.to_i)
    puts "returning position: #{position}"
    data = {:position => position }
    render :json => data, :status => :ok
  end
end
