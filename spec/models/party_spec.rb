require 'rails_helper'

RSpec.describe Party, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:party) ).to be_valid
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:party_name) }

  	context "External boolean validation" do
  		it { should allow_value(true).for(:external) }
		  it { should allow_value(false).for(:external) }
		  it { should_not allow_value(nil).for(:external) }
  	end
  end

  describe "ActiveRecord Validations" do
  	it { should belong_to(:contract) }
  	it { should validate_presence_of(:contract) }
  end
end

# Parties Involved​ (REQUIRED)​
# ​  Field: ​University of the Philippines (can be more than 1)
#   Indicate UP units involved​ - expected input: text​
#   External Parties
#   Indicate organizations (can be more than 1)​ - expected input: text​