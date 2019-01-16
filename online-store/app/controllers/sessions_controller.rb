class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        login_info = params[:user]
        return redirect_to signin_path if !login_info[:username] || login_info[:username].empty? || !login_info[:password]
        user = User.find_by(username: login_info[:username])
        user = user.try(:authenticate, login_info[:password])
        return redirect_to signin_path unless user
        session[:user_id] = user.id
        @user = user
        redirect_to root_path
    end

    def destroy
     
    end
end