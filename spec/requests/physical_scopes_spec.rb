require 'rails_helper'

RSpec.describe "PhysicalScopes", type: :request do
  describe "GET /physical_scopes" do
    it "works! (now write some real specs)" do
      get physical_scopes_path
      expect(response).to have_http_status(200)
    end
  end
end
