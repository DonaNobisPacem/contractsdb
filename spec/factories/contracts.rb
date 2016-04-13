FactoryGirl.define do
  factory :contract do
    contract_type 1
    contract_name { FFaker::Education.degree }
	objectives { FFaker::BaconIpsum.paragraph }
	confirmation_date DateTime.now
	approval_date DateTime.now + 10
	start_date DateTime.now + 20
	end_date DateTime.now + 30
	attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'upseal.png')) }
	# payment_payer { FFaker::Company.name }
	# payment_payee { FFaker::Company.name }
	# payment_amount "9.99"
	# payment_frequency "MyString"
	# payment_start_date DateTime.now
	# payment_end_date DateTime.now + 10
	# escalation_rate "9.99"
	# payment_advance "9.99"
	# security_deposit "9.99"
	# address { FFaker::Address.street_address }
	# land_area "9.99"
	# boundaries { FFaker::BaconIpsum.paragraph }
	# use_of_premises { FFaker::BaconIpsum.paragraph }
  end
end
