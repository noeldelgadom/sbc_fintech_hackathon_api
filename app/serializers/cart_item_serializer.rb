class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :user
  has_one :company
  has_one :item
end
