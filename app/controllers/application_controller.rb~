class ApplicationController < ActionController::Base
  protect_from_forgery

  # redirect to login form if not logged in
  def check_status
    if !current_user()
      flash.now[:notice] = 'You must log in to view that page'
      redirect_to "/login"
    end
  end

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
      is_admin ||= @current_user.admin if @current_user
    end
    helper_method :admin
end
