json.extract! user, :id, :uid, :name, :nickname, :image, :email, :account_number, :created_at, :updated_at
json.url user_url(user, format: :json)
