class User < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :items, through: :transactions

    has_secure_password

    # validations
    validates :balance, :numericality => {:greater_than_or_equal_to => 0}

end
