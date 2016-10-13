require 'rails_helper'

RSpec.describe CommitteeMember, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:committee_member) ).to be_valid
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:member_name) }

  	context "leader boolean validation" do
      it { should allow_value(true).for(:leader) }
	  it { should allow_value(false).for(:leader) }
	  it { should_not allow_value(nil).for(:leader) }
  	end
  end

  describe "ActiveRecord Validations" do
  	it { should belong_to(:committee) }
  	it { should validate_presence_of(:committee) }
  end
end

# Committees/Groups Formed in relation to the Contract​ - As User: Applicable or Not Applicable​
#   Member of the Committee/Group and his/her Organization​​ (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
#   Leader of the Committee/Group and his/her Organization (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
#   Responsibilities of the Committee/Group​ (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text