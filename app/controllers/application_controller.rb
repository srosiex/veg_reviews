class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    private
    
    def logged_in?
        !!current_user
    end
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    
    def authenticate
        if !logged_in?
            redirect_to login_path
    end
end

def authenticate_user(meal)
    authenticate
    redirect '/index' if @meal && current_user != @meal.user
end

end
