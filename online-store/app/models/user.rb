class User < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :items, through: :transactions

    has_secure_password

    # validations
    validates :balance, :numericality => {:greater_than_or_equal_to => 0}
    validates_presence_of :username
    validates_presence_of :password
    validates_presence_of :name
end
