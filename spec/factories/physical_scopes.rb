FactoryGirl.define do
  factory :physical_scope do
    address { FFaker::Address.street_address }
	land_area "9.99"
	boundaries { FFaker::BaconIpsum.paragraph }
	use_of_premises { FFaker::BaconIpsum.paragraph }
	contract
  end

end
