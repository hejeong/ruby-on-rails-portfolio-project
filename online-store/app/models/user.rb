class User < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :items, through: :transactions

    has_secure_password
end
