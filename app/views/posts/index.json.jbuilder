json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :text, :stock_id, :member_id
  json.url post_url(post, format: :json)
end
