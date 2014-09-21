require 'rails_helper'

describe Player do

  let(:player)   {Player.new({symbol: "x", ai: "n"})}
  let(:computer) {Player.new({symbol: "o", ai: "y"})}

  it "should return correct player game piece" do
    expect(player.game_piece).to eq("x")
  end

  # it "should create an Ai object" do
  #   expect(player.create_ai.class).to eq(ComputerAi)
  # end

  it "returns true if creating ai" do
    expect(player.check_for_ai("y")).to eq(true)
  end

  it "returns true if creating ai and takes full word" do
    expect(player.check_for_ai("yes")).to eq(true)
  end

  it "returns true if creating ai and is not case sensitive" do
    expect(player.check_for_ai("Y")).to eq(true)
  end

  it "returns false if not creating ai" do
    expect(player.check_for_ai("n")).to eq(false)
  end

  it "returns false if not creating ai and takes full word" do
    expect(player.check_for_ai("no")).to eq(false)
  end

  it "returns false if not creating ai and is not case sensitive" do
    expect(player.check_for_ai("N")).to eq(false)
  end

  it "should create an Ai object" do
    expect(computer.ai.class).to eq(ComputerAi)
  end

  # it "should return new position" do
  #   expect(computer.game_to_ai).to eq(4)
  # end
end
