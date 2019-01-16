class ItemsController < ApplicationController
    def new 
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        redirect_to item_path(@item)
    end

    def edit
        @item = Item.find(params[:id])
    end 

    def update
        
    end

    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
        @transaction = Transaction.new
    end

    def destroy
        @item = Item.find(params[:id])
        @item.delete
    end

    private 

    def item_params
        params.require(:item).permit(:title, :description, :cost)
    end
end