class CartItem < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :company
  belongs_to :user
end
