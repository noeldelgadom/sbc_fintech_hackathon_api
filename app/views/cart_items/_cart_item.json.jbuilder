json.extract! cart_item, :id, :user_id, :company_id, :item_id, :quantity, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
