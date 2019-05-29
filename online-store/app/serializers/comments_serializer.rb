class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :item_id, :content
end
