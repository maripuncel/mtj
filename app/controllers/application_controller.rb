class ApplicationController < ActionController::Base
  protect_from_forgery

  # redirect to login form if not logged in
  def check_status
    if !current_user()
      flash.now[:notice] = 'You must log in to view that page'
      redirect_to "/"
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

end
