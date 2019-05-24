class ItemsController < ApplicationController
    before_action :admin_only, except: [:index, :show]
    def new 
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.valid?
            @item.save
            redirect_to item_path(@item)
        else
            render 'items/new'
        end
    end

    def edit
        @item = Item.find(params[:id])
    end 

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to item_path(@item)
    end

    def index
        @items = Item.all
        respond_to do |format|
            format.html { render :index }
            format.json { render json: @items}
        end
    end

    def show
        @item = Item.find(params[:id])
        @transaction = Transaction.new
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @item}
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.delete
        redirect_to items_path
    end

    private 

    def item_params
        params.require(:item).permit(:title, :description, :cost, :stock, :image_url)
    end
end