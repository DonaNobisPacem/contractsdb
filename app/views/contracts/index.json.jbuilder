json.array!(@contracts) do |contract|
  json.extract! contract, :id, :contract_type, :objectives, :start_date, :end_date
  json.url contract_url(contract, format: :json)
end
