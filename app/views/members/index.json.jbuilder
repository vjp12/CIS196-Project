json.array!(@members) do |member|
  json.extract! member, :id, :name, :id, :email, :funds, :active_investments, :value
  json.url member_url(member, format: :json)
end
