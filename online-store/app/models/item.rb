class Item < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :users, through: :transactions

    validates_presence_of :title 
    validates_presence_of :cost
    validates :cost, :numericality => {:greater_than => 0}
end
