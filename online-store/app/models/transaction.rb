class Transaction < ApplicationRecord
    # model relationships
    belongs_to :user
    belongs_to :item
end
