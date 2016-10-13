FactoryGirl.define do
  factory :committee_member do
    member_name { FFaker::Name.name}
	leader false
	committee
  end
end
