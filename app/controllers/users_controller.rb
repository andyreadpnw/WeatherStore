class UsersController < ApplicationController
    # before_action :redirect_user

    def index
          @user = User.all
    end
  
    def show
          @user = User.find_by(id: params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to user_path(@user)
      else
        render :new
      end
  
    end
  
    private
    def user_params
      params.require(:user).permit(:username, :zip_code)
    end
end
