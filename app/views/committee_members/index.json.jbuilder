json.array!(@committee_members) do |committee_member|
  json.extract! committee_member, :id, :member_name, :leader, :committee_id
  json.url committee_member_url(committee_member, format: :json)
end
