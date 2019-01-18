class TransactionsController < ApplicationController
    before_action :require_log_in, only: :create
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
        if quantity <= item.stock
            if user.balance >= total_price
                item.stock -= quantity
                user.balance -= total_price
                item.save 
                user.save
            else 
                flash[:error] = "Insufficient funds. Try again later."
            end
        else
            flash[:error] = "Not enough stock. Please try a smaller amount."
            nil
        end
    end
end