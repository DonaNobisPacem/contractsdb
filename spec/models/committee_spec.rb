require 'rails_helper'

RSpec.describe Committee, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:committee) ).to be_valid
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:committee_name) }
  	it { should validate_presence_of(:responsibilities) }
  end

  describe "ActiveRecord Validations" do
  	it { should belong_to(:contract) }
  	it { should validate_presence_of(:contract) }
  	
    it { should have_many(:committee_members) }
    it { should accept_nested_attributes_for(:committee_members).allow_destroy(true) }
  end
end

# Committees/Groups Formed in relation to the Contract​ - As User: Applicable or Not Applicable​
#   Member of the Committee/Group and his/her Organization​​ (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
#   Leader of the Committee/Group and his/her Organization (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
#   Responsibilities of the Committee/Group​ (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
