require 'rails_helper'

RSpec.describe Contract, type: :model do
  it "has a valid factory" do
  	expect( FactoryGirl.build(:contract) ).to be_valid
  end

  describe "ActiveModel Validations" do
  	it { should validate_presence_of(:contract_type) }
  	it { should validate_presence_of(:objectives) }
  	it { should validate_presence_of(:start_date) }
  	it { should validate_presence_of(:end_date) }

  	context "Date Validations" do
  		it "is valid when the contract start date <= contract end date" do
		    expect( FactoryGirl.build(:contract, start_date: DateTime.now, end_date: DateTime.now + 10) ).to be_valid
		  end

  		it "is invalid when the contract start date is > contract end date" do
  		  expect( FactoryGirl.build(:contract, start_date: DateTime.now, end_date: DateTime.now - 10) ).not_to be_valid
  		end
  	end

    context "Financial Terms Validations"
  end

  describe "ActiveRecord Validations" do
  	it { should have_many(:parties) }
  	it { should have_many(:committees) }
  end
end

# contract_type 1
# contract_objectives { FFaker::BaconIpsum.paragraph }
# has_many Party
# contract_start_date DateTime.now + 10
# contract_end_date DateTime.now
# payment_payer { FFaker::Company.name }
# payment_payee { FFaker::Company.name }
# payment_amount "9.99"
# payment_frequency "MyString"
# payment_start_date DateTime.now
# payment_end_date DateTime.now + 10
# escalation_rate "9.99"
# payment_advance "9.99"
# security_deposit "9.99"
# has_many Commitee
# address { FFaker::Address.street_address }
# land_area "9.99"
# boundaries { FFaker::BaconIpsum.paragraph }
# use_of_premises { FFaker::BaconIpsum.paragraph }

# Type of Contract​ (REQUIRED)​
#   Memorandum of Understanding​ (Option 1)​
#   Memorandum of Agreement​ (Option 2)​
#   Contract of Lease​ (Option 3)​
# Objectives of the Contract​ (REQUIRED) - expected input: text​
# Parties Involved​ (REQUIRED)​
# ​  Field: ​University of the Philippines (can be more than 1)
#   Indicate UP units involved​ - expected input: text​
#   External Parties
#   Indicate organizations (can be more than 1)​ - expected input: text​
# Start Date of Contract​ - REQUIRED - expected input: DD MMMM YYYY​
# End Date of Contract​ - REQUIRED - expected input: DD MMMM YYYY​
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
# Committees/Groups Formed in relation to the Contract​ - As User: Applicable or Not Applicable​
#   Member of the Committee/Group and his/her Organization​​ (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
#   Leader of the Committee/Group and his/her Organization (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
#   Responsibilities of the Committee/Group​ (REQUIRED if Applicable)​ - multiple entries allowed - expected input: text
# Physical Scope of Contract - Ask User: Applicable or Not Applicable / Automatically required if Contract of Lease
#   Complete Address of Space/Building Leased​ - expected input: text​
#   Total Land Area​ (in square meters)- expected input: ​numeric value with two decimal places 
#   Boundaries​ - North: text input; South: text input; East: text input; West: text input​
#   Use of Premises ​- expected input: text​