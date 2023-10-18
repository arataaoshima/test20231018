class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            flash[:notice] = "User is successfully created!"
            redirect_to users_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def show

    end

    def index
        @users = User.all
    end

    def edit

    end

    def update
        if @user.update(user_params)
            flash[:notice] = "The user Information is successfully updated!"
            redirect_to users_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :user_image, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end