class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    helper_method :logged_in?, :current_user

    def current_user
        # byebug
        if session[:user_id]
          @user = User.find(session[:user_id])
        end
    end
    
      def logged_in?
        !!current_user
      end
    
      def authorized
        redirect_to root_path unless logged_in?
      end
end
