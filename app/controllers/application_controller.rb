class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?
    helper_method :current_order

  def logged_in?
    !!session[:user_id]
  end

  def redirect_user
    if !logged_in?
      redirect_to login_page_path
    end
  end
  
    def current_order
      if session[:order_id]
        Order.find(session[:order_id])
      else
        Order.new
      end
    end

end
