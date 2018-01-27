class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :item
  has_one :company
  has_one :user
end
