json.array!(@parties) do |party|
  json.extract! party, :id, :party_name, :external, :contract_id
  json.url party_url(party, format: :json)
end
