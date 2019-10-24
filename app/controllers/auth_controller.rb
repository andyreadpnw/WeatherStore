class AuthController < ApplicationController
    def signin
    end
  
    def verify
      # byebug
      # the username the teacher entered in the form
      @user = User.find_by(username: params[:auth][:username])
      if @user
        session[:user_id] = @user.id
        redirect_to products_path
      else
        flash[:message] = "Incorrect Info, please try again."
        render :signin
      end
    end
  
    def logout
      session.clear
      redirect_to login_page_path
    end
end
