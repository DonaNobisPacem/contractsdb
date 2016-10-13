require 'rails_helper'

RSpec.describe PhysicalScope, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:physical_scope) ).to be_valid
  end

  describe "ActiveModel Validations" do

    context "Under Contract of Lease" do
  	  before(:each) { allow(subject).to receive(:is_under_lease?).and_return(true) }

      it { should validate_presence_of(:address) }
      it { should validate_presence_of(:land_area) }
      it { should validate_presence_of(:boundaries) }
      it { should validate_presence_of(:use_of_premises) }
   	end

   	context "Not under Contract of Lease" do
   	  before(:each) { allow(subject).to receive(:is_under_lease?).and_return(false) }

      it { should_not validate_presence_of(:address) }
      it { should_not validate_presence_of(:land_area) }
      it { should_not validate_presence_of(:boundaries) }
      it { should_not validate_presence_of(:use_of_premises) }
   	end

   	# Shared validation regardless of contract type
   	it { should validate_numericality_of(:land_area).is_greater_than_or_equal_to(0) }
  end

  describe "ActiveRecord Validations" do
    it { should belong_to(:contract) }
    it { should validate_presence_of(:contract) }
  end
end

# Physical Scope of Contract - Ask User: Applicable or Not Applicable / Automatically required if Contract of Lease
#   Complete Address of Space/Building Leased​ - expected input: text​
#   Total Land Area​ (in square meters)- expected input: ​numeric value with two decimal places 
#   Boundaries​ - North: text input; South: text input; East: text input; West: text input​
#   Use of Premises ​- expected input: text​