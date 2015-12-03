require "rails_helper"

RSpec.describe CommitteeMembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/committee_members").to route_to("committee_members#index")
    end

    it "routes to #new" do
      expect(:get => "/committee_members/new").to route_to("committee_members#new")
    end

    it "routes to #show" do
      expect(:get => "/committee_members/1").to route_to("committee_members#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/committee_members/1/edit").to route_to("committee_members#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/committee_members").to route_to("committee_members#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/committee_members/1").to route_to("committee_members#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/committee_members/1").to route_to("committee_members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/committee_members/1").to route_to("committee_members#destroy", :id => "1")
    end

  end
end
