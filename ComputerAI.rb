class ComputerAI

  def initialize
    @stradegy = nil
    @rolls = []
  end

  def assess(grid)
    @bs = @rolls.last
    @grid = grid
    unless @stradegy == nil
      self.send(@strategy)
    else
      if grid.flatten.count(" X ") == 0
        first_roll.last
      else 
        bs = @rolls.last
        pull_strategy
      end
    end
  end

  def sidestep
    if @grid[bs[0]-1][bs[1]]==" O "
      [@bs[0],@bs[1]-1]
    elsif @grid[@bs[0]][@bs[1]-1]==" O "
      
    end
  end

  def first_roll
    @rolls << [[0,0],[0,2],[2,0],[2,2]].sample
  end

  def pull_strategy
    if @grid[@bs[0]-1][@bs[1]]==" O " || @grid[@bs[0]][@bs[1]-1]==" O " || @grid[@bs[0]][@bs[1]+1]==" O " || @grid[@bs[0]-1][@bs[1]]==" O "
      @strategy = "sidestep"
      self.send(@strategy)
    elsif @grid[0][0]==" O " || @grid[0][2]==" O " || @grid[2][0]==" O " || @grid[2][2] == " O "
      @strategy = "cornerhugger"
      self.send(@strategy)
    elsif @grid[@bs[0]-2][@bs[1]-1]==" O " || @grid[@bs[0]-1][@bs[1]-2]==" O " || @grid[@bs[0]+1][@bs[1]+2]==" O " || @grid[@bs[0]+2][@bs[1]+1]==" O "
      @strategy = "middlelane" 
      self.send(@strategy)
    elsif @grid[1][1] == " O "
      @strategy = "catstie"
      self.send(@strategy)
    end
  end
end