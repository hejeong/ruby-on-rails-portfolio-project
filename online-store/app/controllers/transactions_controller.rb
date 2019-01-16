class TransactionsController < ApplicationController
    def create
        transaction = Transaction.create(user_id: current_user.id, item_id: params[:item_id])
        redirect_to items_path
    end

 
end