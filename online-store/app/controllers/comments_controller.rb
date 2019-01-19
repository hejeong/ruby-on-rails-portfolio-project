class CommentsController < ApplicationController
    before_action :require_log_in, except: [:show, :index]
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(user_id: current_user.id, item_id: params[:item_id], content: params[:comment][:content])
        redirect_to item_comment_path(@comment.item_id,@comment)
    end

    def show
        @comment = Comment.find(params[:id])
        @user = User.find_by(id: @comment.user_id)
        @item = Item.find_by(id: @comment.item_id)
    end

    def index
        @comments = Comment.where(item_id: params[:item_id])
        @item = Item.find_by(id: params[:item_id])
    end

end