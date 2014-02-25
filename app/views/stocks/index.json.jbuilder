json.array!(@stocks) do |stock|
  json.extract! stock, :id, :name, :price, :market_value, :investors
  json.url stock_url(stock, format: :json)
end
