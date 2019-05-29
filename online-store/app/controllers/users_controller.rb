class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save;
            session[:user_id] = user.id
            @user = user
            redirect_to user_path(@user)
        else
            @user = user
            render 'users/new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if !@user
            redirect_to '/'
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :username, :password, :balance)
    end

end