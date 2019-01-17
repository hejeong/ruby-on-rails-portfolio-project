class TransactionsController < ApplicationController
    def create
        if valid_transaction?
            transaction = Transaction.create(user_id: current_user.id, item_id: params[:item_id], quantity: params[:transaction][:quantity])
        end
        redirect_to items_path
    end
    
    private

    def valid_transaction?
        item = Item.find_by(id: params[:item_id])
        quantity = Integer(params[:transaction][:quantity])
        total_price = quantity * item.cost
        user = current_user
        if  quantity <= item.stock && user.balance >= total_price
            item.stock -= quantity
            user.balance -= total_price
            item.save 
            user.save
        else
            nil
        end
    end
end