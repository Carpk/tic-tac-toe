class ComputerAi < ActiveRecord::Base

  def initialize
    @strategy = nil
    @human_position = []
    @pc_position = [9]
  end

  def assess(user_position)
    @human_position << user_position
    @user_position = user_position
    puts @user_position
    unless @strategy == nil
      self.send(@strategy)
    else
      # if user_position.count(" X ") == 0
      #   @pc_position << 8
      # else 
        pull_strategy
      # end
    end
    @pc_position.last
  end

  def pull_strategy
    case @user_position
    when 1
      @strategy = "cornerjumper"
    when 2 && 4
      @strategy = "middlelane" 
    when 3 && 7 
      puts "cornerhugger"
      @strategy = "cornerhugger"
    when 5
      @strategy = "catstie"
    when 6 && 8
      @strategy = "sidestep"
    end
    self.send(@strategy)
  end

  def cornerhugger
    case @pc_position.last
    when 9
      @pc_position << 1
    when 1
      if @grid[4] == "   "
        @pc_position << 4 # ends game, from upper left
      elsif @grid[2] == "   "
        @pc_position << 2
        @strategy = "cornerhugger_top"
      elsif @grid[6] == "   "
        @pc_position << 6
        @strategy = "cornerhugger_bottom"
      end
    end
  end

end
