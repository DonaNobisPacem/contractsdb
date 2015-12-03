require 'rails_helper'

RSpec.describe "CommitteeMembers", type: :request do
  describe "GET /committee_members" do
    it "works! (now write some real specs)" do
      get committee_members_path
      expect(response).to have_http_status(200)
    end
  end
end
