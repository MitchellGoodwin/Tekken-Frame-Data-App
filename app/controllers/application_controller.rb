class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :admin?
    
    def current_user
        User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end

    def admin?
        if logged_in?
            current_user.admin
        end
    end
end
