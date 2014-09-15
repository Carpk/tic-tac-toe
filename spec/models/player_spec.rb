require 'rails_helper'

describe Player do

  let(:player)   {Player.new({symbol: "x", ai: "n"})}
  let(:computer) {Player.new({symbol: "o", ai: "y"})}

  it "should return correct player game piece" do
    player.game_piece.should eq("x")
  end

  # it "should create an Ai object" do
  #   player.create_ai.class.should eq(ComputerAi)
  # end

  it "returns true if creating ai" do
    player.check_for_ai("y").should eq(true)
  end

  it "returns true if creating ai and takes full word" do
    player.check_for_ai("yes").should eq(true)
  end

  it "returns true if creating ai and is not case sensitive" do
    player.check_for_ai("Y").should eq(true)
  end

  it "returns false if not creating ai" do
    player.check_for_ai("n").should eq(false)
  end

  it "returns false if not creating ai and takes full word" do
    player.check_for_ai("no").should eq(false)
  end

  it "returns false if not creating ai and is not case sensitive" do
    player.check_for_ai("N").should eq(false)
  end

  it "should create an Ai object" do
    computer.ai.class.should eq(ComputerAi)
  end

  # it "should return new position" do
  #   computer.game_to_ai.should eq(4)
  # end
end
