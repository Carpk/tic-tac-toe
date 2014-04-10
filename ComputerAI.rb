class ComputerAI

  def initialize
    @stradegy = nil
    @past_rolls = []
  end

  def assess(grid)
    unless @stradegy == nil

    else
      if grid.flatten.count(" X ") == 0
        first_roll.last
      else 
        bs = @past_rolls.last
        # op = grid.index(" O ")
        if grid[bs[0]-1][bs[1]]==" O " || grid[bs[0]][bs[1]-1]==" O " || grid[bs[0]][bs[1]+1]==" O " || grid[bs[0]-1][bs[1]]==" O "
          puts "sidestep"
        elsif grid[0][0]==" O " || grid[0][2]==" O " || grid[2][0]==" O " || grid[2][2] == " O "
          puts "cornerhugger"
        elsif grid[bs[0]-2][bs[1]-1]==" O " || grid[bs[0]-1][bs[1]-2]==" O " || grid[bs[0]+1][bs[1]+2]==" O " || grid[bs[0]+2][bs[1]+1]==" O "
          puts "middlelane" 
        elsif grid[1][1] == " O "
          puts "cats-tie"
        end
      end
    end

  end

  def first_roll
    @past_rolls << [[0,0],[0,2],[2,0],[2,2]].sample
  end
end