require "rails_helper"

RSpec.describe FinancialTermsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/financial_terms").to route_to("financial_terms#index")
    end

    it "routes to #new" do
      expect(:get => "/financial_terms/new").to route_to("financial_terms#new")
    end

    it "routes to #show" do
      expect(:get => "/financial_terms/1").to route_to("financial_terms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/financial_terms/1/edit").to route_to("financial_terms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/financial_terms").to route_to("financial_terms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/financial_terms/1").to route_to("financial_terms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/financial_terms/1").to route_to("financial_terms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/financial_terms/1").to route_to("financial_terms#destroy", :id => "1")
    end

  end
end
