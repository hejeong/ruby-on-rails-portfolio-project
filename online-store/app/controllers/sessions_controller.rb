require 'pry'
class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # sign in by third party service -- Facebook
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
            # sign in with username and password
            login_info = params[:user]
            if !login_info[:username] || login_info[:username].empty? || !login_info[:password]
                flash[:error] = "Username and password cannot be blank. Please try again."
                return redirect_to login_path 
            end
            user = User.find_by(username: login_info[:username])
            user = user.try(:authenticate, login_info[:password])
            # throw error if incorrect credentials
            if !user
                flash[:error] = "Incorrect username or password. Please try again."
                return redirect_to signin_path
            end
        end
        flash[:success] = "Successfully logged in!"
        session[:user_id] = user.id
        @user = user
        redirect_to root_path
    end

    def destroy
        # log out
        session.delete :user_id
        flash[:success] = "Successfully logged out."
        redirect_to root_path
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
end