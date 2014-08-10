require_relative '../models/computer_ai'
require_relative '../models/gameplay'
require_relative '../models/player'
require_relative '../models/tictactoeboard'
require 'pry'

class GameController < ApplicationController

  def new
    board = Array.new(9, " ")
    board[[0,2,6,8].sample] = "O"
    data = {:board => board}
    render :json => data, :status => :ok
  end

  def create
    puts "PARAMS PASSED BOARD: #{params[:board]}"
    # binding.pry
    tttboard = TicTacToeBoard.new(params[:board])
    game = GamePlay.new( tttboard )
    game.computer_turn
    puts "NO WHAMMIES!: #{game.display_board}"
    board = game.display_board
    status = game.gameover?
    data = {:board => board,:win => status }
    render :json => data, :status => :ok
  end
end
