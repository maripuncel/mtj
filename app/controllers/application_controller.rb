class ApplicationController < ActionController::Base
  protect_from_forgery
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if
session[:user_id]
      if @current_user
        return true
      end
      return false
    end

    def admin
      user = User.find(session[:user_id])
      if user && user.email == "Admin"
        @admin = true
      else
        @admin = false
      end

    end
    helper_method :current_user
end
