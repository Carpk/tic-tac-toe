class GameController < ApplicationController

  def new
    @pc = ComputerAi.new
    puts "This is the pc: #{@pc}"
    position = 9
    data = {:position => position }
    render :json => data, :status => :ok
  end

  def create
    puts "This is the pc: #{@pc}"
    position = @pc.assess(params[:positions].last)
    data = {:position => position }
    render :json => data, :status => :ok
  end
end
