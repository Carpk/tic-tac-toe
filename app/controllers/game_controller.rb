class GameController < ApplicationController

  def new
    session[:pc] = ComputerAi.new
    puts "This is the pc: #{session[:pc]}"
    position = 9
    data = {:position => position }
    render :json => data, :status => :ok
  end

  def create
    puts "This is the pc: #{session[:pc]}"
    puts "last should not be nil: #{params[:positions]}"
    position = session[:pc].assess(params[:positions].last.to_i)
    puts "returning position: #{position}"
    data = {:position => position }
    render :json => data, :status => :ok
  end
end
