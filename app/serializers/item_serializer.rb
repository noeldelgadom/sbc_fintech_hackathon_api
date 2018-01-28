class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :category
end
