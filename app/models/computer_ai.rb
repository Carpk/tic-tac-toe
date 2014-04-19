class ComputerAi < ActiveRecord::Base

  def initialize
    @strategy = nil
    @human_position = []
    @pc_position = [9]
    @winning_combos = generate_combos
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
    sleep(rand(0.25..0.75))
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
      @strategy = "cross_split"
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

  def cross_split
    case @pc_position.last
    when 9
      @pc_position << 1
    when 1
      if @human_position.include?(7) == true
        @pc_position << 3
        @strategy = "cross_split_top"
      elsif @human_position.include?(3) == true
        @pc_position << 7
        @strategy = "cross_split_bottom"
      elsif @human_position.include?(2) == true
        @pc_position << 8
        @strategy = "catstie_upperright"
      elsif @human_position.include?(6) == true
        @pc_position << 4
        @strategy = "catstie_upperright"
      elsif @human_position.include?(4) == true
        @pc_position << 6
        @strategy = "catstie_lowerleft"
      elsif @human_position.include?(8) == true
        @pc_position << 2
        @strategy = "catstie_lowerleft"       
      end
    end
  end

  def cross_split_top
    if @human_position.include?(2) == false
      @pc_position << 2
    elsif @human_position.include?(6) == false
      @pc_position << 6
    end   
  end

  def cross_split_bottom
    if @human_position.include?(4) == false
      @pc_position << 4
    elsif @human_position.include?(8) == false
      @pc_position << 8
    end   
  end

  def catstie_upperright # user at 2 or 6
    if @human_position.include?(7) == false
      @pc_position << 7
    elsif @human_position.include?(3) == false
      @pc_position << 3
      @strategy = "catstie_ur_tie"
    end
  end

  def catstie_ur_tie
    if @human_position.include?(2) == false
      @pc_position << 2
    elsif @human_position.include?(6) == false
      @pc_position << 6
    elsif @pc_position.include?(4) == false
      @pc_position << 4
    elsif @pc_position.include?(8) == false
      @pc_position << 8
    end
  end


  def catstie_lowerleft # user at 4 or 8
    if @human_position.include?(3) == false
      @pc_position << 3
    elsif @human_position.include?(7) == false
      @pc_position << 7
      @strategy = "catstie_ll_tie"
    end
  end

  def catstie_ll_tie
    if @human_position.include?(4) == false
      @pc_position << 4
    elsif @human_position.include?(8) == false
      @pc_position << 8
    elsif @pc_position.include?(6) == false
      @pc_position << 6
    elsif @pc_position.include?(2) == false
      @pc_position << 2
    end
  end


  def sidestep # user at 6 or 8
    case @pc_position.last
    when 9
      if @human_position.include?(6) == false
        @pc_position << 6
      elsif @human_position.include?(8) == false
        @pc_position << 8
      end
    when 8
      if @human_position.include?(7) == false
        @pc_position << 7
      else
        @pc_position << 5
      end
    when 6
      if @human_position.include?(3) == false
        @pc_position << 3
      else
        @pc_position << 5
      end      
    when 5
      if @human_position.include?(1) == false
        @pc_position << 1
      elsif @pc_position[-2] == 8
        @pc_position << 2
      elsif @pc_position[-2] == 6
        @pc_position << 4
      end
    end    
  end

  def win?  # This is weird, find a better way!
    win = false
    @winning_combos.each do |combo|
      combo.delete_if { |e| @pc_position.include?(e) }
      win = true if combo.empty?
    end
    win
  end

  def generate_combos
    [[1,2,3],[4,5,6],
     [7,8,9],[1,4,7],
     [2,5,8],[3,6,9],
     [1,5,9],[3,5,7]]
  end
end
