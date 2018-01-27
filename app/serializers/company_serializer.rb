class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :bs, :logo, :org_type
end
