json.array!(@committees) do |committee|
  json.extract! committee, :id, :committee_name, :responsibilities, :contract_id
  json.url committee_url(committee, format: :json)
end
