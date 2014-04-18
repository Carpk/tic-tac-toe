class ComputerAI
  attr_reader :persona

  # def initialize
  #   @persona = personality
  #   @winning_combos = generate_combos
  # end

  # def assess(grid)
  #   @grid = grid
  #   unless @strategy == nil
  #     self.send(@strategy)
  #   else
  #     if grid.count(" X ") == 0
  #       @rolls << 8
  #     else 
  #       pull_strategy
  #     end
  #   end
  #   @rolls.last
  # end


  def win?
    win = false
    @winning_combos.each do |combo|
      combo.delete_if { |e| @rolls.include?(e) }.empty?
      win = true if combo.empty?
    end
    win
  end



  def personality
    [{name: "HAL",
      error: "HAL: Look Dave, I can see you're really upset about this. I honestly think you ought to sit down calmly, take a stress pill, and think things over.",
      tie: "HAL: I'm sorry Dave, I'm afraid I can't do that""HAL: Dave, this conversation can serve no purpose anymore. Goodbye.", 
      win:"HAL: Dave, this conversation can serve no purpose anymore. Goodbye."},
     {name: "WOPR", 
      error: "WOPR: Yes, people do make mistakes.",
      tie: "WOPR: Wouldn't you prefer a nice game of chess?",
      win:"WOPR: A strange game. The only winning move is not to play. How about a nice game of chess?"},
     {name: "GLaDOS", 
      error: "GLaDOS: Cake, and grief counseling, will be available at the conclusion of the test.",
      tie: "GLaDOS: That thing you burned up isn't important to me; it's the fluid catalytic cracking unit. It makes shoes for orphans... nice job breaking it, hero.", 
      win:"GLaDOS: This was a triumph! I'm making a note here: Huge Success. It's hard to overstate my satisfaction. Aperture Science - we do what we must because we can."}].sample
  end
end