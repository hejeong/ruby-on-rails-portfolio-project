class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cost, :rating, :stock, :image_url
end
