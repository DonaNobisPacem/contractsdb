FactoryGirl.define do
  factory :party do
    party_name { FFaker::Company.name }
	external false
	contract 
  end

end
