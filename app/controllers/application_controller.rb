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
    helper_method :current_user

    def admin
      current_user()
      return (@current_user and @current_user.admin)
    end
    helper_method :admin
end
