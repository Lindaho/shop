json.extract! shop, :_id, :name, :tel, :created_at, :updated_at
json.url user_shop_url(shop, format: :json)