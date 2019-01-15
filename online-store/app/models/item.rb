class Item < ApplicationRecord
    # model relationships
    has_many :transactions
    has_many :users, through: :transactions

    validates_presence_of :title, allow_blank: false 
    validates_presence_of :cost, allow_blank: false
    validates :cost, :numericality => {:greater_than => 0}
end
