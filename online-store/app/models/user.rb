class User < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :items, through: :transactions

    has_secure_password

    # validations
    validates :balance, :numericality => {:greater_than_or_equal_to => 0}
    validates_presence_of :username, allow_blank: false 
    validates_presence_of :password, allow_blank: false 
    validates_presence_of :name, allow_blank: false 

    
end
