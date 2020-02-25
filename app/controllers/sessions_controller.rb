class SessionsController < ApplicationController
    def new
        # nothing to do here!
    end
 
    def create
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        else 
            flash[:errors] = "Invalid username or password!"
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end