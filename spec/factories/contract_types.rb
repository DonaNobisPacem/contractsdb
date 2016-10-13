FactoryGirl.define do
  factory :contract_type do
    description { FFaker::NatoAlphabet.callsign }
  end
end
