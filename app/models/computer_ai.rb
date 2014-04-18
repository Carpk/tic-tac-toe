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
    when 2
      @strategy = "middlelane" 
    when 3 
      @strategy = "cornerhugger"
    when 4
      @strategy = "middlelane" 
    when 5
      @strategy = "catstie"
    when 6
      @strategy = "sidestep"
    when 7
      @strategy = "cornerhugger"
    when 8
      @strategy = "sidestep"
    end
    self.send(@strategy)
  end

  def cornerjumper # user at 1
    case @pc_position.last
    when 9
      @pc_position << 3
    when 3
      if @human_position.include?(6) == false # end game early
        @pc_position << 6
      else
        @pc_position << 7
      end
    when 7
      if @human_position.include?(5) == false
        @pc_position << 5
      elsif @human_position.include?(8) == false
        @pc_position << 8
      end
    end 
  end

  def middlelane # user at 2 or 4
    case @pc_position.last
    when 9
      @pc_position << 5
    when 5
      if @human_position.include?(1) == false # end game early
        @pc_position << 1
      elsif @human_position.include?(2) == true
        @pc_position << 3
        @strategy = "middlelane_top"
      elsif @human_position.include?(4) == true
        @pc_position << 7
        @strategy = "middlelane_bottom"
      end
    end 
  end

  def middlelane_top
    if @human_position.include?(6) == false
      @pc_position << 6
    elsif @human_position.include?(7) == false
      @pc_position << 7
    end   
  end

  def middlelane_bottom
    if @human_position.include?(8) == false
      @pc_position << 8
    elsif @human_position.include?(3) == false
      @pc_position << 3
    end
  end

  def cornerhugger # user can only be at 3 or 7
    case @pc_position.last
    when 9
      @pc_position << 1
    when 1
      if @human_position.include?(5) == false
        @pc_position << 5 # ends game, from upper left
      elsif @human_position.include?(3) == false
        @pc_position << 3
        @strategy = "cornerhugger_top"
      elsif @human_position.include?(7) == false
        @pc_position << 7
        @strategy = "cornerhugger_bottom"
      end
    end
  end

  def cornerhugger_top
    if @human_position.include?(2) == false
      @pc_position << 2
    elsif @human_position.include?(6) == false
      @pc_position << 6
    end
  end

  def cornerhugger_bottom
    if @human_position.include?(4) == false
      @pc_position << 4
    elsif @human_position.include?(8) == false
      @pc_position << 8
    end
  end

end
