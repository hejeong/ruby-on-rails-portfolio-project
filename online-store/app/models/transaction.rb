class Transaction < ApplicationRecord
    # model relationships
    belongs_to :user
    belongs_to :item

    # validations
    validates_presence_of :item_id
    validates_presence_of :user_id

    scope :most_popular, -> {select("item_id, COUNT(quantity) as total_price").group("item_id").order("sum(quantity) DESC").limit(1)}
end
