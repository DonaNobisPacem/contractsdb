require 'rails_helper'

RSpec.describe "FinancialTerms", type: :request do
  describe "GET /financial_terms" do
    it "works! (now write some real specs)" do
      get financial_terms_path
      expect(response).to have_http_status(200)
    end
  end
end
