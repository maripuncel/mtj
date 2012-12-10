class StaticPagesController < ApplicationController

  def check_logged_in
    is_logged_in = current_user()
    if !is_logged_in
      flash.now[:notice] = 'You must log in to view that page'
      redirect_to('/login')
    end
    return is_logged_in
  end

  def home
    current_user()
  end

  def register
    redirect_if_logged_in()
    render :layout => false
  end

  def login
    redirect_if_logged_in()
    render :layout => false
  end

  def change_password
    if !check_logged_in()
      return
    end
  end
 

  def redirect_if_logged_in()
    if current_user()
      flash[:notice] = 'Already logged in'
      redirect_to :controller => 'companies', :action => 'index'
    end
  end

end
