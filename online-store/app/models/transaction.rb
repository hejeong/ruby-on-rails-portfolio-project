class Transaction < ApplicationRecord
    # model relationships
    belongs_to :user
    belongs_to :item

    # validations
    validates_presence_of :item_id
    validates_presence_of :user_id
end
