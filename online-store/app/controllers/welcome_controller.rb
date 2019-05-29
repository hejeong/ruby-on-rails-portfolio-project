class WelcomeController < ApplicationController
  def home
    hash = Transaction.group(:item_id).sum(:quantity)
    if hash.empty?
      @popular_item = nil;
    else 
      array_pair = find_popular_item(hash)
      @popular_item = Item.find(array_pair.first)
    end
  end

  private
  def find_popular_item(hash)
    hash.max_by do |item_id,quantity| 
        quantity
    end
  end
end