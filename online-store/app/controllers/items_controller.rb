class ItemsController < ApplicationController
    def new 
        @item = Item.new
    end

    def create

    end

    def index

    end

    def show

    end

    def destroy

    end

    private 

    def item_params
        params.require(:item).permit(:title, :description, :cost)
    end
end