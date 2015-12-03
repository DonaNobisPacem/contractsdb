require "rails_helper"

RSpec.describe PhysicalScopesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/physical_scopes").to route_to("physical_scopes#index")
    end

    it "routes to #new" do
      expect(:get => "/physical_scopes/new").to route_to("physical_scopes#new")
    end

    it "routes to #show" do
      expect(:get => "/physical_scopes/1").to route_to("physical_scopes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/physical_scopes/1/edit").to route_to("physical_scopes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/physical_scopes").to route_to("physical_scopes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/physical_scopes/1").to route_to("physical_scopes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/physical_scopes/1").to route_to("physical_scopes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/physical_scopes/1").to route_to("physical_scopes#destroy", :id => "1")
    end

  end
end
