class BoardValidator

  def initialize(board)
    @board = board
  end

  def self.validates?(board)
    BoardValidator.new(board).valid?
  end
    
  def valid?
    board.grid.class == Array && !invalid_elements?
  end

  private
  attr_reader :board
  
  def invalid_elements?
    board.grid.map {|e| correct_klass?(e) && correct_length?(e)}.include?(false)
  end

  def correct_klass?(element)
    element.class == String
  end

  def correct_length?(element)
    element.length == 1
  end
end
