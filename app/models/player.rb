class Player
  attr_reader :game_piece, :ai, :computer_active

  def initialize(params)
    @game_piece = params[:symbol]
    @computer_active = check_for_ai(params[:ai])
    @ai = ComputerAi.new(params)
  end

  def check_for_ai(ai_switch)
    ai_switch[0].downcase == "y"
  end

  def game_to_ai(board)
    @ai.assert_values(board)
  end

end
