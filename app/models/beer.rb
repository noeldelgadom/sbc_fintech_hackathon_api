class Beer < ApplicationRecord
  has_many :cart_items, as: :items, dependent: :destroy
end
