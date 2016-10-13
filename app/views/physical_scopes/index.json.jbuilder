json.array!(@physical_scopes) do |physical_scope|
  json.extract! physical_scope, :id, :address, :land_area, :boundaries, :use_of_premises, :contract_id
  json.url physical_scope_url(physical_scope, format: :json)
end
