json.array!(@contract_types) do |contract_type|
  json.extract! contract_type, :id, :description
  json.url contract_type_url(contract_type, format: :json)
end
