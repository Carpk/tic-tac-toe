# require 'rails_helper'

# describe DisplayUtility do

#   let(:display)  {DisplayUtility.new}

#   it "should prompt for AI option" do
#     STDOUT.should_receive(:puts).with("Will x be a computer? (y or n)")
#     display.create_ai_request("x")
#   end

#   it "should prompt for player to enter symbol" do
#     STDOUT.should_receive(:puts).with("Please enter your game piece symbol for player:")
#     display.create_player_prompt("player")
#   end

#   it "should display prompt for player x to enter position" do
#     STDOUT.should_receive(:puts).with("Please enter your position on the keypad for player x:")
#     display.prompt_player_move("x")
#   end

#   it "should display prompt for player o to enter position" do
#     STDOUT.should_receive(:puts).with("Please enter your position on the keypad for player o:")
#     display.prompt_player_move("o")
#   end

#   it "should prompt for player to enter position" do
#     STDOUT.should_receive(:puts).with("Game Over!")
#     display.gameover_notice
#   end

#   it "should prompt error message" do
#     STDOUT.should_receive(:puts).with("That was an invalid option, please try again")
#     display.invalid_input_error
#   end
# end