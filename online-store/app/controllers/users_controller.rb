class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        return redirect_to signup_path unless user.valid?
        session[:user_id] = user.id
        @user = user
        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :username, :password, :balance)
    end

end