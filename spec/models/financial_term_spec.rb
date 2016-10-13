require 'rails_helper'

RSpec.describe FinancialTerm, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:financial_term) ).to be_valid
  end

  describe "ActiveModel Validations" do

    context "Under Contract of Lease" do
  	  before(:each) { allow(subject).to receive(:is_under_lease?).and_return(true) }

      it { should validate_presence_of(:payer) }
      it { should validate_presence_of(:payee) }
      it { should validate_presence_of(:amount) }
      it { should validate_presence_of(:frequency) }
      it { should validate_presence_of(:start_date) }
      it { should validate_presence_of(:end_date) }
      it { should validate_presence_of(:escalation_rate) }
      it { should validate_presence_of(:advance) }
      it { should validate_presence_of(:deposit) }
   	end

   	context "Not under Contract of Lease" do
   	  before(:each) { allow(subject).to receive(:is_under_lease?).and_return(false) }

      it { should_not validate_presence_of(:payer) }
      it { should_not validate_presence_of(:payee) }
      it { should_not validate_presence_of(:amount) }
      it { should_not validate_presence_of(:frequency) }
      it { should_not validate_presence_of(:start_date) }
      it { should_not validate_presence_of(:end_date) }
      it { should_not validate_presence_of(:escalation_rate) }
      it { should_not validate_presence_of(:advance) }
      it { should_not validate_presence_of(:deposit) }
   	end

   	# Shared validation regardless of contract type
   	it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:escalation_rate).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:advance).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:deposit).is_greater_than_or_equal_to(0) }

   	context "Date Validations" do
  		it "is valid when the financial_term start date <= financial_term end date" do
		    expect( FactoryGirl.build(:financial_term, start_date: DateTime.now, end_date: DateTime.now + 10) ).to be_valid
		  end

  		it "is invalid when the financial_term start date is > financial_term end date" do
  		  expect( FactoryGirl.build(:financial_term, start_date: DateTime.now, end_date: DateTime.now - 10) ).not_to be_valid
  		end
  	end

  end

  describe "ActiveRecord Validations" do
    it { should belong_to(:contract) }
    it { should validate_presence_of(:contract) }
  end
end

# Financial Terms​ - Ask User: Applicable or Not Applicable / Automatically required if Contract of Lease
#   Payment​ (REQUIRED if Applicable)​
#   Payer​​ - expected input - text 
#   Payee​ - expected input - text​
#   Amount (in PhP)​ - expected input - numeric value with two decimal places
#   Frequency​ - expected input - Options: Monthly, Semi-Annually, Annually, User Indicated Text ​
#   Start Date of Payment​ - expected input - DD MMMM YYYY​
#   End Date of Payment​ - expected input - DD MMMM YYYY​
#   Escalation Rate​ - expected input - numeric value​ in percent
#   Advance Payment​ - expected input - numeric value with two decimal places​
#   Security Deposit ​- expected input - numeric value with two decimal places​