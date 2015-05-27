require "rails_helper"

RSpec.describe GaragesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/garages").to route_to("garages#index")
    end

    it "routes to #new" do
      expect(:get => "/garages/new").to route_to("garages#new")
    end

    it "routes to #show" do
      expect(:get => "/garages/1").to route_to("garages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/garages/1/edit").to route_to("garages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/garages").to route_to("garages#create")
    end

    it "routes to #update" do
      expect(:put => "/garages/1").to route_to("garages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/garages/1").to route_to("garages#destroy", :id => "1")
    end

  end
end
