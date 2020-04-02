class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]


    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            redirect_to login_path
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show

    end

    def edit
        
    end

    def update
        @user.assign_attributes(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
          else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
          end
    end

    def destroy
        @user.destroy
        redirect_to "/"
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :name, :password, :password_confirmation, :age, :img_url, :email, :country, :bio)
    end

end
