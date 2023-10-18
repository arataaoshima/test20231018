class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end
    
    def authenticate_user
        if @current_user == nil
            flash[:notice] = "You need to log in to access this content"
            redirect_to root_path
        end
    end

end
