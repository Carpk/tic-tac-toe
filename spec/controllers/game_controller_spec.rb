require 'rails_helper'

describe GameController do

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "new has 200 status" do
    get :new
    expect(response).to be_success
  end

  it "new has 200 status" do
    get :new
    expect(response.status).to eq(200)
  end

  # it "create has 200 status" do
  #   json: {type: :json model: {"board"=>["X", " ", " ", " ", " ", " ", " ", " ", " "]} }
  #   get :create, :json
  #   expect(response.status).to eq(200)
  # end

  # it "returns json object for first turn" do
  #   json: {"board"=>["X", " ", " ", " ", " ", " ", " ", " ", " "]}
  #   post :create, :json
  #   expect(response).to be_success
  # end
end