require 'rails_helper'

describe GameController do

  # let(:computer)  {ComputerAi.new({symbol: "x", opponent: "o"})}

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "returns json object for first turn" do
    get :new
    expect(response).to be_success
  end
end