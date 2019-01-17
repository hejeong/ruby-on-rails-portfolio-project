require 'pry'
class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if auth
            user = User.find_by(uid: auth['uid']) 
            if !user 
                user = User.new(uid: auth['uid'])
                user.password = SecureRandom.hex(9)
                user.name = auth['info']['name']
                user.email = auth['info']['email']
                user.save
            end
        else 
            login_info = params[:user]
            return redirect_to login_path if !login_info[:username] || login_info[:username].empty? || !login_info[:password]
            user = User.find_by(username: login_info[:username])
            user = user.try(:authenticate, login_info[:password])
            return redirect_to signin_path unless user
        end
        session[:user_id] = user.id
        @user = user
        redirect_to root_path
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
end