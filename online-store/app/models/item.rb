class Item < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :users, through: :transactions
end
