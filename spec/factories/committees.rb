FactoryGirl.define do
  factory :committee do
    committee_name { FFaker::Company.name }
	responsibilities { FFaker::BaconIpsum.paragraph }
	contract
  end
end
