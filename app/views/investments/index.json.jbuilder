json.array!(@investments) do |investment|
  json.extract! investment, :id, :id_id, :name_id, :stock_id, :share_change
  json.url investment_url(investment, format: :json)
end
