class CommentsController < ApplicationController
    before_action :require_log_in, except: [:show, :index]
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(user_id: current_user.id, item_id: params[:item_id], content: params[:content])
        redirect_to item_comments(@comment)
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def index
        @comment = Comments.where(item_id: params[:item_id])
    end

end