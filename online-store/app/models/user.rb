class User < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :items, through: :transactions
end
