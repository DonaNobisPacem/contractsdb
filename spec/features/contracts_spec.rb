require 'rails_helper'

RSpec.feature "Contracts", type: :feature do

  describe "GET /contracts" do

    before(:each) do
      FactoryGirl.create(:contract, objectives: "Valid Objective")
      FactoryGirl.create(:contract, objectives: "Invalid Objective")
      Contract.reindex
    end

    it "it has a list of contracts" do
      visit contracts_path
      expect(page).to have_content "Valid Objective"
      expect(page).to have_content "Invalid Objective"
    end

    context "search for a contract" do

      it "it has a list of contracts" do
        visit contracts_path
        expect(page).to have_content "Valid Objective"
        expect(page).to have_content "Invalid Objective"
      end

      it "searches for a contract" do
        visit contracts_path(:search => "Valid")
        # visit "/contracts?search=Valid"

        expect(page).to have_content "Valid Objective"
        expect(page).not_to have_content "Invalid Objective"
      end

    end
  end
end
