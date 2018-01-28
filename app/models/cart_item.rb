class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :item
end
