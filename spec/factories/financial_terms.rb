FactoryGirl.define do
  factory :financial_term do
    payer { FFaker::Name.name }
	payee { FFaker::Name.name }
	amount "9.99"
	frequency { FFaker::UnitMetric.temperature_name }
	start_date DateTime.now
	end_date DateTime.now + 10
	escalation_rate "9.99"
	advance "9.99"
	deposit "9.99"
	contract
  end
end
