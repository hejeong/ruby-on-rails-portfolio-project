class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :admin?
    helper_method :feature
    
    def current_user 
        if logged_in?
            User.find(session[:user_id])
        else
            nil
        end
    end

    def logged_in?
        redirect_to signin_path unless session[:user_id]
    end

    def admin?
        if current_user
          current_user.admin
        else 
            nil
        end
    end

    def feature
        Item.find_by(id: Transaction.most_popular.first.item_id)
    end
end
