class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user 
        if logged_in?
            User.find(session[:user_id])
        else
            nil
        end
    end

    def logged_in?
        session[:user_id] != nil
    end
end
