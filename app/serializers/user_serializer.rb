class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :nickname, :image, :email
end
