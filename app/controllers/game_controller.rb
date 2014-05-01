class GameController < ApplicationController

  def new
    session[:hu] = []
    session[:pc] = []
    position = ComputerAi.new.assess(session[:hu])
    data = {:position => position }
    render :json => data, :status => :ok
  end

  def create
    session[:hu] << params[:positions].last.to_i
    position = ComputerAi.new.assess(session[:hu])
    status = session[:pc].win?
    data = {:position => position,:win => status }
    render :json => data, :status => :ok
  end
end
